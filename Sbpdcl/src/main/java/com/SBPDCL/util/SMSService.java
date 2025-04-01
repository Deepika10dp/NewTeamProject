package com.SBPDCL.util;

public class SMSService {
    public static void sendSMS(String phoneNo, String message) {
        System.out.println("Sending SMS to " + phoneNo + ": " + message);
        // Integrate with an SMS API here.
    }
}