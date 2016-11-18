package com.cyber.smedu.pay.service;

import java.util.List;
import java.util.Map;

import com.cyber.smedu.pay.domain.ClassRegistrationDomain;


public interface PayService {

	List<ClassRegistrationDomain> selectClassregistrationPayHistory(String studentCode);

}
