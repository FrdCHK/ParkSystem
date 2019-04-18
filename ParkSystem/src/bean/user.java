package bean;
import java.util.Objects;
public class user {
String name;
String passwd;
public user() {}
public String getName() {
	return name;
}
public String getPasswd() {
	return passwd;
}
public void setName(String n) {
	this.name=n;
}
public void setPasswd(String p) {
	this.passwd=p;
}
public boolean equeals(Object o) {
	if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    user usr = (user) o;
    return Objects.equals(name, usr.name) &&
            Objects.equals(passwd, usr.passwd);
}
}
