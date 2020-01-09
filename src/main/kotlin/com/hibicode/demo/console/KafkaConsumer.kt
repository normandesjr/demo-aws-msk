package com.hibicode.demo.console

import org.springframework.kafka.annotation.KafkaListener
import org.springframework.messaging.handler.annotation.Payload
import org.springframework.stereotype.Component

@Component
class KafkaConsumer {

    @KafkaListener(topics = ["\${kafka.topic}"], groupId = "mygroup")
    fun receive(@Payload text: String) {
        println("############### CONSUMIDOR ################")
        println("####### texto recebido: $text")
        println("############### FIM ################")
    }

}