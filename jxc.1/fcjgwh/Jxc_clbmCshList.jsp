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
	String	dqbm=request.getParameter("dqbm");

	String myxssl=request.getParameter("myxssl");//ÿҳ��ʾ����

	ls_sql="SELECT clbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,bzjldwbm,bzgg,djzl,cgzq,bzq,bztxq,cldlbm,scsmc,ppmc,DECODE(cglb,'J','���Ųɹ�','D','�ط��ɹ�'),lrr,lrsj,dwmc,jxc_clbm.bz ";
	ls_sql+=" FROM jxc_clbm,sq_dwxx  ";
    ls_sql+=" where jxc_clbm.lrbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and jxc_clbm.cllb='1'";//0�����ģ�1������
    ls_sql+=" and jxc_clbm.clbm not in(select clbm from jxc_cljgb where dqbm='"+dqbm+"')";
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clbmCshList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"���ϳ�ʼ��"};//��ť����ʾ����
	String[] buttonLink={"SaveChooseDqbm.jsp?dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">ȫ��δ��ʼ������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="5%">���ϱ���</td>
	<td  width="5%">����С��</td>
	<td  width="5%">�ڲ�����</td>
	<td  width="10%">��������</td>

	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">��װ������λ</td>
	<td  width="3%">��װ���</td>
	<td  width="3%">��������</td>
	<td  width="3%">�ɹ�����</td>
	<td  width="3%">������</td>
	<td  width="3%">����������</td>
	<td  width="5%">���ϴ���</td>
	<td  width="6%">Ʒ��</td>
	<td  width="8%">��Ʒ��</td>
	<td  width="3%">�ɹ����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="8%">��ע</td>
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