package com.cyber.smedu.stats.repository;

import com.cyber.smedu.stats.domain.StatsDomain;

public interface StatsDao {

	StatsDomain isToday(String day);

	int updateStats(String day);

	int insertStats(StatsDomain stats);

	int totalCount();

	int monthJoinStudentCount();

}
