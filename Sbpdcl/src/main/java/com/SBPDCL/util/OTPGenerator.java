package com.SBPDCL.util;

import java.security.SecureRandom;

public class OTPGenerator {

    private static final String DIGITS = "0123456789";
    private static final int OTP_LENGTH = 6;

    public static String generateOTP() {
        SecureRandom random = new SecureRandom();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);

        for (int i = 0; i < OTP_LENGTH; i++) {
            int index = random.nextInt(DIGITS.length());
            otp.append(DIGITS.charAt(index));
        }

        return otp.toString();
    }

    public static void main(String[] args) {
        // Test OTP generation
        System.out.println("Generated OTP: " + generateOTP());
    }
}