/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.websocket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

/**
 *
 * @author mahefa
 */
@ServerEndpoint("/api/planning") 
public class PlanningWebSocket {

    private static Session session;

    @OnOpen
    public void onOpen(Session s) {
        session = s;
        System.out.println("Nouvelle connexion WebSocket : " + session.getId());
    }

    @OnClose
    public void onClose(Session session) {
        session = null;
        System.out.println("Connexion WebSocket fermée : " + session.getId());
    }

     public static void notifyClients() {
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText("refresh");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Erreur WebSocket : " + throwable.getMessage());
    }
}
