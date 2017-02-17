package com.web.booking.service;

import java.util.List;

import com.web.booking.model.Room;

public interface RoomService {

	public List<Room> getAllRooms();

	public void saveRoom(Room room);

	public void deleteRoom(int roomId);

	public Room getRoom(int roomId);
}
