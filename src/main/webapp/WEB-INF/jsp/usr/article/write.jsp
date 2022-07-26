<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST"
      action="../article/doWrite">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>작성자</th>
            <td>${rq.loginedMember.nickname}</td>
          </tr>
          <tr>
            <th>게시판</th>
            <td>
              <select class="select select-bordered" name="boardId">
                <option selected disabled>게시판을 선택해주세요.</option>
                <option value="1">공지</option>
                <option value="2">자유</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input required="required"
                class="input input-bordered w-full max-w-xs"
                name="title" type="text" placeholder="제목" />
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
              <textarea required="required"
                class="textarea textarea-bordered w-full"
                placeholder="Bio" name="body" rows="10"></textarea>
            </td>
          </tr>
          <tr>
            <th>작성</th>
            <td>
              <input class="btn btn-active" type="submit" value="저장" />
              <button class="btn btn-outline" type="button"
                onclick="history.back();">취소</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>
