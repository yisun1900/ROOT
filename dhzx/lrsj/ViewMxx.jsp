<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dwbh=request.getParameter("dwbh");
	String ts1=request.getParameter("ts1");
	String ts2=request.getParameter("ts2");


	String ls_sql=null;
	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrr";
	ls_sql+=" ,crm_scbkhxx.lrsj,round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0) mxxts,crm_zxkhxx.lrsj zxlrsj,round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0) zxts,crm_khxx.qyrq ";
	ls_sql+=" ,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') ";
	ls_sql+=" ,b.dwmc as zxdm,a.dwmc zxdjbm,crm_zxkhxx.khjl";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,crm_khxx,crm_scbkhxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	if (!ts1.equals(""))
	{
		ls_sql+=" and round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>"+ts1;
	}
	if (!ts2.equals(""))
	{
		ls_sql+=" and round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<="+ts2;
	}
	ls_sql+=" order by mxxts,zxts";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">��ѯ�ͻ�--��ѯ</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ҵ��Ա</td>
	<td  width="5%">��ѯ�ͻ�¼����</td>

	<td  width="7%">ë��Ϣ¼��ʱ��</td>
	<td  width="5%">ë��Ϣ¼��ǩ������</td>
	<td  width="7%">��ѯ�ͻ�¼��ʱ��</td>
	<td  width="5%">��ѯ�ͻ�¼��ǩ������</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="8%">��ѯ״̬</td>
	<td  width="8%">��ѯ����</td>
	<td  width="8%">��ѯ�ͻ�¼�벿��</td>
	<td  width="4%">�ͻ�����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>