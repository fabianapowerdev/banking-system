package com.br.banking_system.usuario;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class UsuarioTest {

    @Test
    @DisplayName("Deve criar um usuário com nome e e-mail válidos")
    void deveCriarUsuarioComDadosValidos(){
        //Arrange
        String nomeUsuario = "José das Quantas";
        String emailUsuario = "zedasquantas@teste.com.br";

        //Act
        //O código abaixo causará erro de compilação inicialmente
        Usuario usuario = new Usuario(nomeUsuario, emailUsuario);

        //Assert
        assertThat(usuario.getNome()).isEqualTo(nomeUsuario);
        assertThat(usuario.getEmail()).isEqualTo(emailUsuario);
    }
}
