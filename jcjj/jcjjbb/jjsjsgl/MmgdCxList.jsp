<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String ls_sql=null;
String wheresql="";
String xmzy=null;
String xm=cf.GB2Uni(request.getParameter("XM"));
xmzy=request.getParameter("xmzy");
if (xmzy!=null)
{
	xmzy=xmzy.trim();
	if (!(xmzy.equals("")))	wheresql+="  and (jc_mmydd.xmzy='"+xmzy+"')";

}

String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;

	ls_sql="SELECT yddbh,sq_yhxx.yhmc,jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.hth, DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����'),jc_mmydd.sqdj,jc_mmydd.clgw,jc_mmydd.pdgc,jc_mmydd.htje, DECODE(jc_mmydd.wjsgsbz,'Y','���͹�˾','N','δ�͹�˾'), DECODE(jc_mmydd.clzt,'00','¼��δ���','01','Ԥ�������','02','���ɵ�','03','����ɳ���','04','ǩ����ͬ','05','�����','06','��װ���','99','ȡ������'),jc_mmydd.lrsj,sq_dwxx.dwmc  ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+)  and sq_yhxx.yhdlm=jc_mmydd.xmzy and jc_mmydd.clzt not in ('06','99')";
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj,yddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("MmgdCxList.jsp","SelectXmzy.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yddbh","jc_mmydd_khbh","crm_khxx_khxm","crm_khxx_hth","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_clgw","jc_mmydd_pdgc","jc_mmydd_htje","jc_mmydd_wjsgsbz","jc_mmydd_clzt","jc_mmydd_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">ľ����ĿרԱ���������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">Ԥ�������</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="6%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="8%">��ͬ��</td>
	<td  width="8%">������</td>
	<td  width="6%">��ȡ����</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="10%">�ɵ�����</td>
	<td  width="7%">��ͬ���</td>
	<td  width="9%">�Թ������͵���˾</td>
	<td  width="9%">����״̬</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>
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