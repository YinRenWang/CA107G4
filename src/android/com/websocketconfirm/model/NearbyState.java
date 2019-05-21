package android.com.websocketconfirm.model;

import java.util.Set;

public class NearbyState {
	private String type;
	// the user changing the state
	private String user;
	// total users
	private Set<MyLocationVO> locations;

	public NearbyState(String type, String user, Set<MyLocationVO> locations) {
		super();
		this.type = type;
		this.user = user;
		this.locations = locations;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Set<MyLocationVO> getUsers() {
		return locations;
	}

	public void setUsers(Set<MyLocationVO> locations) {
		this.locations = locations;
	}

}
