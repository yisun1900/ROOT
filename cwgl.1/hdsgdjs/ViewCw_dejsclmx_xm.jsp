<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	String wlbm=request.getParameter("wlbm");

	ls_sql="SELECT wlbm,glflmc,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,DECODE(lx,'1','�����ж�Ӧ����','2','�޶�Ӧ����') lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(bzdj),TO_CHAR(dj),ylclyl,slclyl,xbclk  ";
	ls_sql+=" FROM cw_dejsclmx,bdm_cljldwbm,bdm_glflbm  ";
    ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
    ls_sql+=" and cw_dejsclmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and cw_dejsclmx.glflbm=bdm_glflbm.glflbm(+)";

    ls_sql+=" UNION ALL ";
/*
*/
	ls_sql+=" SELECT wlbm,glflmc,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,'' lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(dj),TO_CHAR(dj),xhl,0,0  ";
	ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm,bdm_glflbm  ";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.wlbm='"+wlbm+"'";
    ls_sql+=" and bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_khglfxb.glflbm=bdm_glflbm.glflbm(+)";
	ls_sql+=" and bj_khglfxb.glflbm='1' and bj_khglfxb.wlllbz='N' ";//ֻȡ�����࣬��������Ҫ��������

	ls_sql+=" order by wlllbz desc,lx desc,glmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">������������ϸ��<%=khbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">������ϱ���</td>
	<td  width="5%">���Ϸ������</td>
	<td  width="5%">�赽��������</td>
	<td  width="7%">����</td>
	<td  width="16%">��������</td>
	<td  width="12%">Ʒ��</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">���㵥��</td>
	<td  width="7%">Ӧ���������</td>
	<td  width="7%">ʵ���������</td>
	<td  width="8%">�貹���Ͽ�</td>
</tr>
<%
		pageObj.displayDateSum();
%> 
</table>

���㵥�ۣ�
<BR>���Ƿ��������ϣ�ֱ��ȡȡ���Ϸ�����ĵ��ۣ�
<BR>�����������ϣ�����г����¼����ȡƽ�����ۣ���û�г����¼������������ϼ۸����ȡ���µ��ۣ�
<BR>�����������ϣ�������û�ж�Ӧ���ϣ����˹�¼��ͻ����Ϸ�����ֱ��ȡȡ���Ϸ�����ĵ��ۣ�
<BR>�Զ�����Ŀ�����˹�¼��ͻ����Ϸ�����ֱ��ȡȡ���Ϸ�����ĵ���


<CENTER >
  <B><font size="3">�������ϳ�������嵥��<%=khbh%>��</font></B>
</CENTER>
<%

	ls_sql="select wlbm,glmc,pp,xhgg,cljldwmc,NVL2(wljsbz,TO_CHAR(ROUND(sum(sl*dj)/sum(sl*wljsbz),2)),0),sum(sl*wljsbz) ckzsl,sum(sl*dj) ckzje ";
	ls_sql+=" from bdm_cljldwbm,bj_clckmx,bj_clckd  ";
    ls_sql+=" where bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
    ls_sql+=" and bj_clckmx.jsjldwbm=bdm_cljldwbm.cljldwbm(+) and bj_clckd.ckdh=bj_clckmx.ckdh ";
	ls_sql+=" group by wlbm,glmc,pp,xhgg,cljldwmc,dj,wljsbz";
    ls_sql+=" order by wlbm,glmc,pp,xhgg,cljldwmc,dj,wljsbz";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�������ϱ���</td>	
	<td  width="12%">������������</td>
	<td  width="12%">Ʒ��</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">ƽ������</td>
	<td  width="10%">����������</td>
	<td  width="10%">�����ܽ��</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>


</body>

</html>