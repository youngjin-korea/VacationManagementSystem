package com.kcc.vacation.domain.grantedvacation.dto.request;

import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@Getter
@Setter
public class GrantPagingDTO {

    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int prevPage;
    private int nextPage;
    private List<GrantedVacationList> grantedVacationList;
    private GrantSavePagingInfo gpi;
    private int total;


    public GrantPagingDTO(GrantSavePagingInfo gpi, int total, List<GrantedVacationList> grantedVacationList) {
        this.gpi = gpi;
        this.total = total;
        this.grantedVacationList = grantedVacationList;

        /* 마지막 페이지 */
        this.endPage = (int)(Math.ceil(gpi.getPageNum() / 5.0)) * 5;
        /* 시작 페이지 */
        this.startPage = this.endPage - 4;  // 5개 페이지씩 보이므로 4를 빼줍니다.

        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0 / gpi.getAmount()));

        /* 전체 마지막 페이지(realEnd)가 화면에 보이는 마지막 페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;

        /* 마지막 페이지(endPage)값이 전체 마지막 페이지(realEnd)보다 작은 경우 true */
        this.next = this.endPage < realEnd;
    }

}
