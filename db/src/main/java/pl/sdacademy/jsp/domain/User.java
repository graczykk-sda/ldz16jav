package pl.sdacademy.jsp.domain;

import lombok.Data;

@Data
public class User {
    private long id;
    private String name;
    private String surname;
    private String photoUrl;
}
