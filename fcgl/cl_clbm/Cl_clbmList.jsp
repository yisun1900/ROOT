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
	String lrjsfs=null;
	String lrbfb=null;
	String jldwmc=null;
	String cldlmc=null;

	String clbm=null;
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
	}

	String clmc=null;
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+clmc+"%')";
	}
	String clgg=null;
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+clgg+"%')";
	}

	String wxr=null;
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (cl_clbm.lx='"+lx+"')";
	}
	
	
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}

	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
	}
	lrbfb=request.getParameter("lrbfb");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
	}
	lrbfb=request.getParameter("lrbfb2");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
	}
	ls_sql="SELECT paixu,DECODE(lx,'1','����','2','�ǳ���'),clbm,clmc,wxr,clgg,cldlmc,jldwmc,DECODE(lrjsfs,'1','��۷�ʽ','2','�ٷֱȷ�ʽ'),lrbfb||'%',lrr,lrsj,bz  ";
	ls_sql+=" FROM cl_clbm";
    ls_sql+=" where (1=1) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlmc,clbm ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_clbmList.jsp","","","EditCl_clbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","clmc","clgg","lrjsfs","lrbfb","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","�滻ά����"};//��ť����ʾ����
	String[] buttonLink={"Cl_clbmList.jsp?","plthLxr.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] clbm = request.getParameterValues("clbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(clbm,"clbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from cl_clbm where "+chooseitem;
		sql[1]="delete from cl_jgmx where "+chooseitem;
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
  <B><font size="3">ά�����ϱ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="4%">����</td>
	<td  width="7%">���ϱ���</td>
	<td  width="16%">��������</td>
	<td  width="4%">ά����</td>
	<td  width="11%">���Ϲ��</td>
	<td  width="9%">���ϴ���</td>
	<td  width="5%">������λ</td>
	<td  width="6%">������㷽ʽ</td>
	<td  width="4%">����ٷֱ�</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="16%">��ע</td>
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