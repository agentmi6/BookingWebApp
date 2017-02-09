package com.websystique.springsecurity.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.websystique.springsecurity.model.Room;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Room> getAllRooms() {
		Session session = sessionFactory.getCurrentSession();

		Query<Room> query = session.createQuery("from Room", Room.class);

		List<Room> rooms = query.getResultList();

		return rooms;
	}

	@Override
	public void saveRoom(Room room) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(room);
	}

	@Override
	public void deleteRoom(int roomId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Room where id=:roomId");
		query.setParameter("roomId", roomId);

		query.executeUpdate();

	}

	@Override
	public Room getRoom(int roomId) {
		Session session = sessionFactory.getCurrentSession();

		Room room = session.get(Room.class, roomId);

		return room;
	}

}
