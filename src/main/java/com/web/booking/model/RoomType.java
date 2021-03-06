package com.web.booking.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "room_type")
public class RoomType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "room_type_id")
	private int roomTypeId;

	@NotEmpty(message = "Room type name is required!!!")
	@Column(name = "room_type_name")
	private String roomTypeName;

	@Min(100)
	@Column(name = "room_type_price")
	private double roomTypePrice;

	@OneToMany(mappedBy = "roomType")
	private List<Room> rooms;

	@OneToMany(mappedBy = "roomType")
	private List<Booking> bookings;

	public int getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public String getRoomTypeName() {
		return roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	public double getRoomTypePrice() {
		return roomTypePrice;
	}

	public void setRoomTypePrice(double roomTypePrice) {
		this.roomTypePrice = roomTypePrice;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

}
