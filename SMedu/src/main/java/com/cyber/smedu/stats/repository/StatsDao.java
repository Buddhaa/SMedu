package com.cyber.smedu.stats.repository;

import java.util.List;

import com.cyber.smedu.stats.domain.StatsDomain;
import com.cyber.smedu.user.domain.UserDomain;

public interface StatsDao {

	StatsDomain isToday(String day);

	int updateStats(String day);

	int insertStats(StatsDomain stats);

	int totalCount();

	int monthJoinStudentCount();

	int monthStudentPayCount();

	List<UserDomain> recentlyJoinUser();

	StatsDomain studentKnowPathPercent();

}
