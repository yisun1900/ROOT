<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String jzrq=request.getParameter("jzrq");
String dwbh=request.getParameter("dwbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT dwmc,crm_khxx.sjs,DECODE(crm_khxx.zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.qyrq,crm_khxx.tdsj,sgdmc,crm_khxx.zjxm,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.guanlif,crm_khxx.suijin,crm_khxx.suijinbfb,crm_khxx.sjf,crm_khxx.sjhtsjf,crm_khxx.zkl,crm_khxx.cxhdbm,crm_khxx.sfke,cw_fkcs.fkcsmc,crm_khxx.jzkscsj,crm_khxx.jzkfksj,crm_khxx.cwsfke,crm_khxx.cwjzkfkcs,crm_khxx.cwjzkscsj,crm_khxx.cwjzkfksj,crm_khxx.ywy ";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx,sq_sgd,cw_fkcs  ";
    ls_sql+=" where cw_qmjzmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
    ls_sql+=" order by crm_khxx.zt desc,crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs,crm_khxx.qyrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ViewCw_qmjz.jsp?jzrq="+jzrq,"","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jzrq","khbh","zt","khxm","hth","sjs","wdzgce","qye","suijin","suijinbfb","sjf","glf","guanlif","zjxje","zhzjxje","zjxsuijin","kglf","kqtk","zkl","cxhdbm","qyrq","tdsj","sgd","zjxm","sfke","jzkfkcs","jzkscsj","jzkfksj","cwsfke","cwjzkfkcs","cwjzkscsj","cwjzkfksj","ywy","fgsbh","dwbh"};
	pageObj.setDisColName(disColName);
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
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
  <B><font size="3">��ѯ�����ҵ����תʱ�䣺<%=jzrq%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="4%">��ǰ��ͬ��</td>
	<td  width="4%">�ۺ��ͬ��</td>
	<td  width="3%">�����</td>
	<td  width="3%">˰��</td>
	<td  width="2%">˰��ٷֱ�</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">��ƺ�ͬ��Ʒ�</td>
	<td  width="2%">ʵ���ۿ���</td>
	<td  width="7%">�μӴ����</td>
	<td  width="4%">��װʵ�����</td>
	<td  width="2%">��װ�������</td>
	<td  width="3%">�״θ���װ��ʱ��</td>
	<td  width="3%">��װ�������ʱ��</td>
	<td  width="4%">�����װʵ�տ��</td>
	<td  width="2%">�����װ�տ�����</td>
	<td  width="3%">�����״��ռ�װ��ʱ��</td>
	<td  width="3%">�����װ����տ�ʱ��</td>
	<td  width="2%">ҵ��Ա</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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