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
	if (!(xmzy.equals("")))	wheresql+="  and (jc_zcdd.xmzy='"+xmzy+"')";

}


String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	ls_sql="SELECT jc_zcdd.ddbh,yhmc, DECODE(jc_zcdd.clzt,'00','����δ���','01','���������','02','������ȷ��','03','���ͻ�'),crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth,jc_zcdd.clgw, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'), DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),jc_zcdd.hkze, DECODE(jc_zcdd.xclbz,'1','�������','2','�ȴ�����֪ͨ','3','������֪ͨ','4','�Ѳ���'),jc_zcdd.lrsj,dwmc,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx,sq_yhxx  ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=sq_dwxx.dwbh and jc_zcdd.xmzy=sq_yhxx.yhdlm and jc_zcdd.clzt not in ('03')  ";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ZcgdCxList.jsp","SelectXmzy.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("lxfs","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">������ĿרԱ���������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�������</td>
	<td  width="4%">��ĿרԱ</td>
    <td  width="6%">����״̬</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">פ��Ҿӹ���</td>
	<td  width="6%">�ͻ���������</td>
	<td  width="8%">����ص�</td>
	<td  width="6%">�ȴ��ͻ�֪ͨ</td>
	<td  width="5%">��ͬ�ܶ�</td>
	<td  width="6%">�����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="9%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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