package com.yojulab.study_springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yojulab.study_springboot.dao.SharedDao;

@Service
public class HelloWorldService {
    @Autowired
    SharedDao sharedDao;

    public int fakeSelect(String companyId) {
        HashMap dataMap = new HashMap<>();
        dataMap.put("companyId", companyId);
        sharedDao.getOne("fake.selectByUID", dataMap);
        return 0;
    }

    public ArrayList fakeSelect(String currentPage, String perPage) {
        // "spm_row": 471, "SN": 1, "CMPNM": "로이유통", "RDNMADR": null
        // "spm_row": 571, "SN": 2, "CMPNM": "의료유통", "RDNMADR": 3
        ArrayList arrayList = new ArrayList<>();
        HashMap resultMap = new HashMap<>();
        resultMap.put("spm_row", 471);
        resultMap.put("SN", 1);
        resultMap.put("CMPNM", "로이유통");
        resultMap.put("RDNMADR", null);
        arrayList.add(resultMap);

        resultMap = new HashMap<>();
        resultMap.put("spm_row", 571);
        resultMap.put("SN", 2);
        resultMap.put("CMPNM", "의료유통");
        resultMap.put("RDNMADR", 3);
        arrayList.add(resultMap);

        return arrayList;
    }

    public ArrayList fakeInsert(Map<String, Object> dataMap) {

        dataMap.put("CAR-00", "CAR-Name-00");
        dataMap.put("CAR-01", "CAR-Name-01");
        dataMap.put("CAR-02", "CAR-Name-02");

        List surveyMapList = new ArrayList<Map>();
        for (String questionId : dataMap.keySet()) {
            Map<String, String> questionAnswerMap = new HashMap<>();
            String answerId = (String) dataMap.get(questionId);
            questionAnswerMap.put("QuestionId", questionId);
            questionAnswerMap.put("AnswerId", answerId);
            surveyMapList.add(questionAnswerMap);
        }
        dataMap.put("surveyMapList", surveyMapList);

        // factoryMap의 Key와 Value 출력
        // for (Map.Entry<String, Object> entry : factoryMap.entrySet()) {
        //     String key = entry.getKey();
        //     String value = (String)entry.getValue();
        //     System.out.println("factoryMap Key: " + key + ", Value: " + value);
        // }
        sharedDao.insert("fake.insert", dataMap);
        return null;
    }
}
