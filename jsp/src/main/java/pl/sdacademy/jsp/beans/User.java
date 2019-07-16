package pl.sdacademy.jsp.beans;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class User {
    private String name;
    private String surname;
    private String address;
    private String phone;
    private String email;
    private Integer age;

    public static User fromString(String serialized) {
        User user = new User();
        String substring = serialized.substring(5, serialized.length() - 1);
        System.out.println(substring);
        String[] splitted = substring.split(", ");
        for (String pair : splitted) {
            setParam(user, pair);
        }

        return user;
    }

    private static void setParam(User user, String param) {
        String[] split = param.split("=");
        String key = split[0];
        String value = split[1];
        switch (key) {
            case "name":
                user.setName(value);
                break;
            case "surname":
                user.setSurname(value);
                break;
            case "phone":
                user.setPhone(value);
                break;
            case "email":
                user.setEmail(value);
                break;
            case "address":
                user.setAddress(value);
                break;
            case "age":
                user.setAge(Integer.parseInt(value));
                break;
        }
    }

}
