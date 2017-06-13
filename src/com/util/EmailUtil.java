package com.util;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang.StringUtils;

import com.dto.EmailDTO;


public class EmailUtil {

	public static void send(EmailDTO emailDTO) throws AddressException, MessagingException {
		String host = null;
		String port = null;
		String toAddress = null;
		String ccAddress = null;
		String bccAddress = null;
		String subject = null;
		String htmlBody = null;
		Map<String, String> mapInlineImages = null;

		try {
			final String userName = emailDTO.getUserName();
			final String password = emailDTO.getPassword();
			host = emailDTO.getHost();
			port = emailDTO.getPort();
			toAddress = emailDTO.getToAddress();
			ccAddress = emailDTO.getCcAddress();
			bccAddress = emailDTO.getBccAddress();
			subject = emailDTO.getSubject();
			htmlBody = emailDTO.getHtmlBody();
			

			Properties properties = new Properties();
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.user", userName);
			properties.put("mail.password", password);

			// creates a new session with an authenticator
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password);
				}
			};
			Session session = Session.getInstance(properties, auth);

			// creates a new e-mail message
			Message msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(userName));
			InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
			if (StringUtils.isNotEmpty(bccAddress)) {
				msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(bccAddress));
			}
			if (StringUtils.isNotEmpty(ccAddress)) {
				msg.addRecipient(Message.RecipientType.CC, new InternetAddress(ccAddress));
			}
			msg.setSubject(subject);
			msg.setSentDate(new Date());

			// creates message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent(htmlBody, "text/html");

			// creates multi-part
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			// adds inline image attachments
			if (mapInlineImages != null && mapInlineImages.size() > 0) {
				Set<String> setImageID = mapInlineImages.keySet();

				for (String contentId : setImageID) {
					MimeBodyPart imagePart = new MimeBodyPart();
					imagePart.setHeader("Content-ID", "<" + contentId + ">");
					imagePart.setDisposition(MimeBodyPart.INLINE);

					String imageFilePath = mapInlineImages.get(contentId);
					try {
						imagePart.attachFile(imageFilePath);
					} catch (IOException ex) {
						ex.printStackTrace();
					}

					multipart.addBodyPart(imagePart);
				}
			}

			msg.setContent(multipart);

			Transport.send(msg);
			// logger.error("E:-EmbeddedImageEmailUtil send() End");
			// System.out.println("send success");
		} catch (Exception e) {
			e.printStackTrace();
			// logger.error("E:-EmbeddedImageEmailUtil send() fail");
		}

	}

}
