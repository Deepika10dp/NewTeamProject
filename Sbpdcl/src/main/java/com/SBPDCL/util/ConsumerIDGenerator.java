package com.SBPDCL.util;
import java.util.UUID;

public class ConsumerIDGenerator {
    public static String generateConsumerID() {
        return "CNS" + UUID.randomUUID().toString().substring(0, 6).toUpperCase();
    }
}