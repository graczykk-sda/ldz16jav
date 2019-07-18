package pl.sdacademy.jsp.domain;

import lombok.Builder;
import lombok.Data;

@Data
public class User {
    private String name;
    private String surname;
    private String photoUrl;
}
