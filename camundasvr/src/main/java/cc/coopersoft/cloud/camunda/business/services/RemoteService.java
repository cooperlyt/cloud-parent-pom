package cc.coopersoft.cloud.camunda.business.services;

import cc.coopersoft.common.business.define.BusinessDefine;

public interface RemoteService {

    BusinessDefine getBusinessDefine(String defineId);
}
