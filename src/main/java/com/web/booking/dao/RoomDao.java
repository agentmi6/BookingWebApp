package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.Room;

public interface RoomDao {

	public List<Room> getAllRooms();

	public void saveRoom(Room room);

	public Room getRoom(int roomId);

	public void deleteRoom(int roomId);

}
