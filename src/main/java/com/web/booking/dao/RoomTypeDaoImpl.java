package com.web.booking.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.booking.model.RoomType;

@Repository
public class RoomTypeDaoImpl implements RoomTypeDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<RoomType> getRoomTypes() {
		Session session = sessionFactory.getCurrentSession();

		Query<RoomType> query = session.createQuery("from RoomType", RoomType.class);

		List<RoomType> roomTypes = query.getResultList();

		return roomTypes;
	}

	@Override
	public void saveRoomType(RoomType roomType) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(roomType);

	}

	@Override
	public RoomType getRoomType(int roomTypeId) {
		Session session = sessionFactory.getCurrentSession();

		RoomType roomType = session.get(RoomType.class, roomTypeId);

		return roomType;
	}

	@Override
	public void deleteRoomType(int roomTypeId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from RoomType where id=:roomTypeId");

		query.setParameter("roomTypeId", roomTypeId);

		query.executeUpdate();
	}

}
