package store.model;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDto  implements Serializable{
	
	@NotBlank(message = "Username is mandatory")
	private String username;
	@NotBlank(message = "Password is mandatory")
	private String password;
	@NotBlank(message = "Full name is mandatory")
	private String fullname;
	@NotBlank(message = "Email is mandatory")
	@Email(message = "Email is not valid")
	private String email;
	@NotBlank(message = "Phone is mandatory")
	private String phone;
	@NotBlank(message = "Address is mandatory")
	private String address;
	
	private Boolean isEdit = false;
}
