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
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_zjxm=null;
	String cl_djj_czxh=null;
	String cl_djj_khbh=null;
	String cl_djj_sfjm=null;
	String cl_djj_shzt=null;
	String cl_djj_lrr=null;
	String cl_djj_lrsj=null;
	String cl_djj_dwbh=null;
	String cl_djj_czzt=null;

	String shjl=null;
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		if (!(shjl.equals("")))	wheresql+=" and  (cl_djj.shjl='"+shjl+"')";
	}
	
	
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cl_djj_czxh=request.getParameter("cl_djj_czxh");
	if (cl_djj_czxh!=null)
	{
		cl_djj_czxh=cf.GB2Uni(cl_djj_czxh);
		if (!(cl_djj_czxh.equals("")))	wheresql+=" and  (cl_djj.czxh='"+cl_djj_czxh+"')";
	}
	cl_djj_khbh=request.getParameter("cl_djj_khbh");
	if (cl_djj_khbh!=null)
	{
		cl_djj_khbh=cf.GB2Uni(cl_djj_khbh);
		if (!(cl_djj_khbh.equals("")))	wheresql+=" and  (cl_djj.khbh='"+cl_djj_khbh+"')";
	}
	cl_djj_sfjm=request.getParameter("cl_djj_sfjm");
	if (cl_djj_sfjm!=null)
	{
		cl_djj_sfjm=cf.GB2Uni(cl_djj_sfjm);
		if (!(cl_djj_sfjm.equals("")))	wheresql+=" and  (cl_djj.sfjm='"+cl_djj_sfjm+"')";
	}
	cl_djj_shzt=request.getParameter("cl_djj_shzt");
	if (cl_djj_shzt!=null)
	{
		cl_djj_shzt=cf.GB2Uni(cl_djj_shzt);
		if (!(cl_djj_shzt.equals("")))	wheresql+=" and  (cl_djj.shzt='"+cl_djj_shzt+"')";
	}
	cl_djj_lrr=request.getParameter("cl_djj_lrr");
	if (cl_djj_lrr!=null)
	{
		cl_djj_lrr=cf.GB2Uni(cl_djj_lrr);
		if (!(cl_djj_lrr.equals("")))	wheresql+=" and  (cl_djj.lrr='"+cl_djj_lrr+"')";
	}
	cl_djj_lrsj=request.getParameter("cl_djj_lrsj");
	if (cl_djj_lrsj!=null)
	{
		cl_djj_lrsj=cl_djj_lrsj.trim();
		if (!(cl_djj_lrsj.equals("")))	wheresql+="  and (cl_djj.lrsj>=TO_DATE('"+cl_djj_lrsj+"','YYYY/MM/DD'))";
	}
	cl_djj_lrsj=request.getParameter("cl_djj_lrsj2");
	if (cl_djj_lrsj!=null)
	{
		cl_djj_lrsj=cl_djj_lrsj.trim();
		if (!(cl_djj_lrsj.equals("")))	wheresql+="  and (cl_djj.lrsj<=TO_DATE('"+cl_djj_lrsj+"','YYYY/MM/DD'))";
	}
	cl_djj_dwbh=request.getParameter("cl_djj_dwbh");
	if (cl_djj_dwbh!=null)
	{
		cl_djj_dwbh=cf.GB2Uni(cl_djj_dwbh);
		if (!(cl_djj_dwbh.equals("")))	wheresql+=" and  (cl_djj.dwbh='"+cl_djj_dwbh+"')";
	}
	cl_djj_czzt=request.getParameter("cl_djj_czzt");
	if (cl_djj_czzt!=null)
	{
		cl_djj_czzt=cf.GB2Uni(cl_djj_czzt);
		if (!(cl_djj_czzt.equals("")))	wheresql+=" and  (cl_djj.czzt='"+cl_djj_czzt+"')";
	}

	ls_sql="SELECT cl_djj.czxh, DECODE(cl_djj.czzt,'1','δ�ύ','2','���ύ','3','�Ѵ�ӡ'), DECODE(cl_djj.sfjm,'1','������','2','�������'), DECODE(cl_djj.shzt,'1','δ���','2','һ�����','3','�������'),DECODE(shjl,'1','ͬ��','2','��ͬ��') shjl,DECODE(ejshjl,'1','ͬ��','2','��ͬ��') ejshjl,crm_khxx.khxm,cl_djj.qye,cl_djj.sqlqsl,cl_djj.sqlqje,cl_djj.sjsl,cl_djj.sjje,cl_djj.ylqze,cl_djj.ylqze-cl_djj.sjje,cl_djj.shr,cl_djj.shsj,cl_djj.shyj,cl_djj.ejshr,cl_djj.ejshsj,cl_djj.ejshyj,cl_djj.khbh,crm_khxx.fwdz,sgdmc,sq_dwxx.dwmc  ,cl_djj.lrr,cl_djj.lrsj,cl_djj.bz";
	ls_sql+=" FROM cl_djj,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cl_djj.dwbh=sq_dwxx.dwbh and cl_djj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_djj.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_djjCxshList.jsp","SelectCxshCl_djj.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","czxh","cl_djj_khbh","cl_djj_qye","cl_djj_sqlqsl","cl_djj_sqlqje","cl_djj_sjsl","cl_djj_sjje","cl_djj_sfjm","cl_djj_jmyy","cl_djj_shzt","cl_djj_lrr","cl_djj_lrsj","cl_djj_czzt","cl_djj_bz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"czxh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"�������"};//��ť����ʾ����
	String[] buttonLink={"DeleteJmshCl_djjmx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"czxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewCl_djj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("czxh",coluParm);//�в����������Hash��
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
  <B><font size="3">����һ�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="3%">�Ƿ��������</td>
	<td  width="3%">�������״̬</td>
	<td  width="2%">һ����˽���</td>
	<td  width="2%">������˽���</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ǩԼ��</td>
	<td  width="2%">������ȡ����</td>
	<td  width="4%">������ȡ���</td>
	<td  width="2%">ʵ������</td>
	<td  width="4%">ʵ�ʽ��</td>
	<td  width="4%">Ӧ��ȡ�ܶ�</td>
	<td  width="4%">������</td>
	<td  width="2%">һ�������</td>
	<td  width="3%">һ�����ʱ��</td>
	<td  width="8%">һ��������</td>
	<td  width="2%">���������</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="8%">����������</td>
	<td  width="2%">�ͻ����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">ʩ����</td>
	<td  width="4%">�ֹ�˾</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
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