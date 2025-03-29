package com.esmt.m2isi.config;



import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("enterprisePU");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
