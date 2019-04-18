package bean;
import java.util.Objects;
public class Owner {
String id;
String name;
String phone;
public Owner() {}
public Owner(String i, String n, String p) {
	id=i;
	name=n;
	phone=p;
}
public String getId() {
	return id;
}
public void setId(String i) {
	this.id=i;
}
public String getName() {
	return name;
}
public String getPhone() {
	return phone;
}
public void setName(String n) {
	this.name=n;
}
public void setPhone(String p) {
	this.phone=p;
}
public boolean equeals(Object o) {
	if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Owner usr = (Owner) o;
    return Objects.equals(name, usr.name) &&
            Objects.equals(id, usr.id) &&
            Objects.equals(phone, usr.phone);
}
}
