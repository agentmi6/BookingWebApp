package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.RoomType;

public interface RoomTypeDao {

	public List<RoomType> getRoomTypes();

	public void saveRoomType(RoomType roomType);

	public RoomType getRoomType(int roomTypeId);

	public void deleteRoomType(int roomTypeId);

}
