<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="ȫ����ĿרԱ";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql+=" and jc_mmydd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;

	ls_sql="SELECT yddbh,jc_mmydd.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.jgrq,DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') wjqk,jc_mmydd.sqdj,jc_mmydd.clgw,jc_mmydd.xmzy,b.dwmc pdgc,jc_mmydd.htrq,jhazsj, DECODE(jc_mmydd.clzt,'00','¼��δ���','01','Ԥ�������','02','���ɵ�','03','����ɳ���','04','ǩ����ͬ','05','�����','06','��װ���','99','ȡ������') clzt,a.dwmc lrbm ";
	ls_sql+=" from  jc_mmydd,crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where jc_mmydd.dwbh=a.dwbh and jc_mmydd.pdgc=b.dwbh(+)";
	ls_sql+=" and jc_mmydd.khbh=crm_khxx.khbh ";
	ls_sql+=" and jhazsj<SYSDATE";
	ls_sql+=" and clzt<'06'";
	ls_sql+=wheresql;
	ls_sql+=" order by jhazsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"yddbh","khxm","hth","jgrq","wjqk","sqdj","clgw","xmzy","pdgc","htrq","jhazsj","clzt","lrbm"};
	pageObj.setDisColName(disColName);
/*
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
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ�Ű�װ���ڣ���ĿרԱ��<%=xmzymc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ԥ������</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="9%">��ͬ��</td>
	<td  width="8%">��ͬ��������</td>
	<td  width="6%">������</td>
	<td  width="6%">ľ�Ŷ���</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="12%">�ɵ�����</td>
	<td  width="7%">ǩ��ͬ����</td>
	<td  width="7%">��ͬ��װʱ��</td>
	<td  width="7%">����״̬</td>
	<td  width="12%">¼�벿��</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>