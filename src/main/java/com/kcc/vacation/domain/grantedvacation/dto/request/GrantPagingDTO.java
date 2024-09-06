package com.kcc.vacation.domain.grantedvacation.dto.request;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class PagingDTO {

    private int min;
    // 최대 페이지 번호
    private int max;

    // 이전 버튼의 페이지 번호
    private int prevPage;
    // 다음 버튼의 페이지 번호
    private int nextPage;

    // 전체 페이지 개수
    private int pageCnt;
    // 현재 페이지 번호
    private int currentPage;

    // 페이지당 항목 수
    private int contentPageCnt;

    // 페이지 버튼의 개수
    private int paginationCnt;
    
    @Builder
    public PagingDTO( int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {

        this.currentPage = currentPage;

        pageCnt = contentCnt / contentPageCnt;
        //ex) 533/10=53.3이므로 나머지가 3이므로 1page 더 필요
        if (contentCnt % contentPageCnt > 0) {
            pageCnt++;
        }

        //--------------------------------

        //최소값 = ((현재 페이지 번호-1) / 페이지 당 글의 개수) * 페이지 당 글의 개수 + 1
        //ex) ((1-1)/10)*10+1=1
        //    ((2-1)/10)*10+1=2
        //    ((3-1)/10)*10+1=3

        //ex) ((4-1)/11)*11+1=4
        //    ((5-1)/11)*11+1=5
        min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;

        //최대값 = min +  페이지 버튼의 개수
        //ex) 1 + 2 - 1 = 2 (페이지 버튼의 개수:2, 최소값:1 , 페이지 당 글의 개수:10)
        //(1,2)
        //ex) 4 + 10 -1 = 13 (페이지 버튼의 개수:10, 최소값:4 , 페이지 당 글의 개수:11)
        //(4,5,6,7,8,9,10,11,12,13)
        max = min + paginationCnt - 1;

        //1페이지에 1~9번째 글이 존재할경우 max=1+2-1=2, pageCnt=10/9=1.1 -> 2페이지 필요
        //전체페이지를 넘어가지 않도록 세팅함
        if (max > pageCnt) {
            max = pageCnt;

        }
        prevPage = min-1;
        //다음페이지 누를경우
        nextPage = max+1;

        //마지막페이지를 넘어가지 않도록
        if(nextPage > pageCnt){
            nextPage = pageCnt;
        }
    }
}
