package banking.com;

public class account {

	String name;
	String DOB;
	String address;
	String emailID;
	String accountType;
	
	public account() {
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String DOB) {
		this.DOB = DOB;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public account(String name, String DOB, String address, String emailID,
			String accountType) {
		super();
		this.name = name;
		this.dOB = DOB;
		this.address = address;
		this.emailID = emailID;
		this.accountType = accountType;
	}
	}
