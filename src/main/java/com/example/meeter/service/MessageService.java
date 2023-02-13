package com.example.meeter.service;

import com.example.meeter.domain.Message;
import com.example.meeter.domain.User;
import com.example.meeter.domain.dto.MessageDto;
import com.example.meeter.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.swing.text.html.parser.Entity;

@Service

public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<MessageDto> messageList(Pageable pageable, String filter, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, pageable, user);
        } else {
            return messageRepo.findAll(pageable, user);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        if (currentUser.equals(author)) {
            return messageRepo.findByUser(pageable, author);
        } else {
            return messageRepo.findByUser(pageable, currentUser, author);
        }
    }
}
