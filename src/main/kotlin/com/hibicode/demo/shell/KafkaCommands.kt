package com.hibicode.demo.shell

import org.springframework.beans.factory.annotation.Value
import org.springframework.kafka.core.KafkaTemplate
import org.springframework.shell.standard.ShellComponent
import org.springframework.shell.standard.ShellMethod

@ShellComponent
class KafkaCommands(
    private val kafkaTemplate: KafkaTemplate<String, Any>
) {

    @Value("\${kafka.topic}") private lateinit var topicName: String

    @ShellMethod("Envia o texto para o tópico")
    fun produce(text: String) {
        println("Produzindo...")
        kafkaTemplate.send(topicName, text)
        println("enviado.")
    }

}