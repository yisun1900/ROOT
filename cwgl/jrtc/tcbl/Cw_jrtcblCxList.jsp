<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_jrtcbl_fgsbh=null;
	cw_jrtcbl_fgsbh=request.getParameter("cw_jrtcbl_fgsbh");
	if (cw_jrtcbl_fgsbh!=null)
	{
		cw_jrtcbl_fgsbh=cf.GB2Uni(cw_jrtcbl_fgsbh);
		if (!(cw_jrtcbl_fgsbh.equals("")))	wheresql+=" and  (cw_jrtcbl.fgsbh='"+cw_jrtcbl_fgsbh+"')";
	}
	ls_sql="SELECT sq_dwxx.dwmc,cw_jrtcbl.dzsjftcbl,cw_jrtcbl.dzzxftcbl,cw_jrtcbl.wyzxftcbl,cw_jrtcbl.khjlsjftcbl,cw_jrtcbl.khjlzxftcbl,cw_jrtcbl.sjssjftcbl,cw_jrtcbl.sjszxftcbl,cw_jrtcbl.sjsycftcbl,cw_jrtcbl.zjzxftcbl,cw_jrtcbl.zjycftcbl,cw_jrtcbl.xqzgzxftcbl,cw_jrtcbl.xqzzzxftcbl,cw_jrtcbl.xqzyzxftcbl,cw_jrtcbl.wlyxzgzxftcbl,cw_jrtcbl.yxzyzxftcbl,cw_jrtcbl.wzchzxftcbl,cw_jrtcbl.wysjzxftcbl,cw_jrtcbl.wzcxyzxftcbl,cw_jrtcbl.dhzyzxftcbl,cw_jrtcbl.wztgyzxftcbl,cw_jrtcbl.sjzxftcbl,cw_jrtcbl.clyzxftcbl,cw_jrtcbl.lrr,cw_jrtcbl.lrsj  ";
	ls_sql+=" FROM cw_jrtcbl,sq_dwxx  ";
    ls_sql+=" where cw_jrtcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrtcbl.fgsbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrtcblCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�ֹ�˾</td>
	<td  width="3%">�곤��Ʒ���ɱ���</td>
	<td  width="3%">�곤װ�޷���ɱ���</td>
	<td  width="3%">��Աװ�޷���ɱ���</td>
	<td  width="3%">ҵ��Ա��Ʒ���ɱ���</td>
	<td  width="3%">ҵ��Աװ�޷���ɱ���</td>
	<td  width="3%">���ʦ��Ʒ���ɱ���</td>
	<td  width="3%">���ʦװ�޷���ɱ���</td>
	<td  width="3%">���ʦԶ�̷���ɱ���</td>
	<td  width="3%">�ͻ�����װ�޷���ɱ���</td>
	<td  width="3%">�ͻ�����Զ�̷���ɱ���</td>
	<td  width="3%">С������װ�޷���ɱ���</td>
	<td  width="3%">С���鳤װ�޷���ɱ���</td>
	<td  width="3%">С��רԱװ�޷���ɱ���</td>
	<td  width="3%">����Ӫ������װ�޷���ɱ���</td>
	<td  width="3%">Ӫ��רԱװ�޷���ɱ���</td>
	<td  width="3%">��վ�߻�װ�޷���ɱ���</td>
	<td  width="3%">��ҳ���װ�޷���ɱ���</td>
	<td  width="3%">��վ����Աװ�޷���ɱ���</td>
	<td  width="3%">�绰רԱװ�޷���ɱ���</td>
	<td  width="3%">��վ�ƹ�Աװ�޷���ɱ���</td>
	<td  width="3%">˾��װ�޷���ɱ���</td>
	<td  width="3%">����Աװ�޷���ɱ���</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>