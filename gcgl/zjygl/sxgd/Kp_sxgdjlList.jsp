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
	String kp_sxgdjl_sxjlh=null;
	String kp_sxgdjl_yhdlm=null;
	String kp_sxgdjl_sxsj=null;
	kp_sxgdjl_sxjlh=request.getParameter("kp_sxgdjl_sxjlh");
	if (kp_sxgdjl_sxjlh!=null)
	{
		kp_sxgdjl_sxjlh=kp_sxgdjl_sxjlh.trim();
		if (!(kp_sxgdjl_sxjlh.equals("")))	wheresql+=" and (kp_sxgdjl.sxjlh="+kp_sxgdjl_sxjlh+") ";
	}
	kp_sxgdjl_yhdlm=request.getParameter("kp_sxgdjl_yhdlm");
	if (kp_sxgdjl_yhdlm!=null)
	{
		kp_sxgdjl_yhdlm=cf.GB2Uni(kp_sxgdjl_yhdlm);
		if (!(kp_sxgdjl_yhdlm.equals("")))	wheresql+=" and  (kp_sxgdjl.yhdlm='"+kp_sxgdjl_yhdlm+"')";
	}
	kp_sxgdjl_sxsj=request.getParameter("kp_sxgdjl_sxsj");
	if (kp_sxgdjl_sxsj!=null)
	{
		kp_sxgdjl_sxsj=kp_sxgdjl_sxsj.trim();
		if (!(kp_sxgdjl_sxsj.equals("")))	wheresql+="  and (kp_sxgdjl.sxsj>=TO_DATE('"+kp_sxgdjl_sxsj+"','YYYY/MM/DD'))";
	}
	kp_sxgdjl_sxsj=request.getParameter("kp_sxgdjl_sxsj2");
	if (kp_sxgdjl_sxsj!=null)
	{
		kp_sxgdjl_sxsj=kp_sxgdjl_sxsj.trim();
		if (!(kp_sxgdjl_sxsj.equals("")))	wheresql+="  and (kp_sxgdjl.sxsj<=TO_DATE('"+kp_sxgdjl_sxsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kp_sxgdjl.sxjlh,sq_yhxx.yhmc,kp_sxgdjl.sxsj,kp_sxgdjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,sgdmc,crm_khxx.zjxm  ";
	ls_sql+=" FROM crm_khxx,kp_sxgdjl,sq_yhxx,sq_sgd  ";
    ls_sql+=" where kp_sxgdjl.yhdlm=sq_yhxx.yhdlm(+) and kp_sxgdjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_sxgdjl.sxjlh  desc,crm_khxx.khxm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_sxgdjlList.jsp","SelectKp_sxgdjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sxjlh","khbh","sq_yhxx_yhmc","kp_sxgdjl_sxsj","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_kgrq","crm_khxx_sjkgrq","crm_khxx_jgrq","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sxjlh","khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_sxgdjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sxjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_sxgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sxjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sxjlh","1");//�в����������Hash��
	spanColHash.put("yhmc","1");//�в����������Hash��
	spanColHash.put("sxsj","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_sxgdjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">ɸѡ��¼��</td>
	<td  width="5%">ɸѡ��</td>
	<td  width="5%">ɸѡʱ��</td>
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">��ϵ��ʽ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="5%">��ͬ��������</td>
	<td  width="5%">ʵ�ʿ�������</td>
	<td  width="5%">��ͬ��������</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���̵���</td>
</tr>
<%
	pageObj.printDate();
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