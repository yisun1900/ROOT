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
	String crm_hfdjjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_hfdjjl_djbh=null;
	String crm_hfdjjl_hfdjbz=null;
	String crm_hfdjjl_djyy=null;
	String crm_hfdjjl_djsj=null;
	String crm_hfdjjl_djr=null;
	String crm_hfdjjl_jhjdsj=null;
	String crm_hfdjjl_sjjdsj=null;
	String crm_hfdjjl_jdr=null;
	String crm_hfdjjl_hfrq=null;
	String crm_hfdjjl_hflxbm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	crm_hfdjjl_khbh=request.getParameter("crm_hfdjjl_khbh");
	if (crm_hfdjjl_khbh!=null)
	{
		crm_hfdjjl_khbh=cf.GB2Uni(crm_hfdjjl_khbh);
		if (!(crm_hfdjjl_khbh.equals("")))	wheresql+=" and  (crm_hfdjjl.khbh='"+crm_hfdjjl_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_hfdjjl_djbh=request.getParameter("crm_hfdjjl_djbh");
	if (crm_hfdjjl_djbh!=null)
	{
		crm_hfdjjl_djbh=cf.GB2Uni(crm_hfdjjl_djbh);
		if (!(crm_hfdjjl_djbh.equals("")))	wheresql+=" and  (crm_hfdjjl.djbh='"+crm_hfdjjl_djbh+"')";
	}
	crm_hfdjjl_hfdjbz=request.getParameter("crm_hfdjjl_hfdjbz");
	if (crm_hfdjjl_hfdjbz!=null)
	{
		crm_hfdjjl_hfdjbz=cf.GB2Uni(crm_hfdjjl_hfdjbz);
		if (!(crm_hfdjjl_hfdjbz.equals("")))	wheresql+=" and  (crm_hfdjjl.hfdjbz='"+crm_hfdjjl_hfdjbz+"')";
	}
	crm_hfdjjl_djyy=request.getParameter("crm_hfdjjl_djyy");
	if (crm_hfdjjl_djyy!=null)
	{
		crm_hfdjjl_djyy=cf.GB2Uni(crm_hfdjjl_djyy);
		if (!(crm_hfdjjl_djyy.equals("")))	wheresql+=" and  (crm_hfdjjl.djyy='"+crm_hfdjjl_djyy+"')";
	}
	crm_hfdjjl_djsj=request.getParameter("crm_hfdjjl_djsj");
	if (crm_hfdjjl_djsj!=null)
	{
		crm_hfdjjl_djsj=crm_hfdjjl_djsj.trim();
		if (!(crm_hfdjjl_djsj.equals("")))	wheresql+="  and (crm_hfdjjl.djsj=TO_DATE('"+crm_hfdjjl_djsj+"','YYYY/MM/DD'))";
	}
	crm_hfdjjl_djr=request.getParameter("crm_hfdjjl_djr");
	if (crm_hfdjjl_djr!=null)
	{
		crm_hfdjjl_djr=cf.GB2Uni(crm_hfdjjl_djr);
		if (!(crm_hfdjjl_djr.equals("")))	wheresql+=" and  (crm_hfdjjl.djr='"+crm_hfdjjl_djr+"')";
	}
	crm_hfdjjl_jhjdsj=request.getParameter("crm_hfdjjl_jhjdsj");
	if (crm_hfdjjl_jhjdsj!=null)
	{
		crm_hfdjjl_jhjdsj=crm_hfdjjl_jhjdsj.trim();
		if (!(crm_hfdjjl_jhjdsj.equals("")))	wheresql+="  and (crm_hfdjjl.jhjdsj=TO_DATE('"+crm_hfdjjl_jhjdsj+"','YYYY/MM/DD'))";
	}
	crm_hfdjjl_sjjdsj=request.getParameter("crm_hfdjjl_sjjdsj");
	if (crm_hfdjjl_sjjdsj!=null)
	{
		crm_hfdjjl_sjjdsj=crm_hfdjjl_sjjdsj.trim();
		if (!(crm_hfdjjl_sjjdsj.equals("")))	wheresql+="  and (crm_hfdjjl.sjjdsj=TO_DATE('"+crm_hfdjjl_sjjdsj+"','YYYY/MM/DD'))";
	}
	crm_hfdjjl_jdr=request.getParameter("crm_hfdjjl_jdr");
	if (crm_hfdjjl_jdr!=null)
	{
		crm_hfdjjl_jdr=cf.GB2Uni(crm_hfdjjl_jdr);
		if (!(crm_hfdjjl_jdr.equals("")))	wheresql+=" and  (crm_hfdjjl.jdr='"+crm_hfdjjl_jdr+"')";
	}
	crm_hfdjjl_hfrq=request.getParameter("crm_hfdjjl_hfrq");
	if (crm_hfdjjl_hfrq!=null)
	{
		crm_hfdjjl_hfrq=crm_hfdjjl_hfrq.trim();
		if (!(crm_hfdjjl_hfrq.equals("")))	wheresql+="  and (crm_hfdjjl.hfrq=TO_DATE('"+crm_hfdjjl_hfrq+"','YYYY/MM/DD'))";
	}
	crm_hfdjjl_hflxbm=request.getParameter("crm_hfdjjl_hflxbm");
	if (crm_hfdjjl_hflxbm!=null)
	{
		crm_hfdjjl_hflxbm=cf.GB2Uni(crm_hfdjjl_hflxbm);
		if (!(crm_hfdjjl_hflxbm.equals("")))	wheresql+=" and  (crm_hfdjjl.hflxbm='"+crm_hfdjjl_hflxbm+"')";
	}
	ls_sql="SELECT crm_hfdjjl.djbh, crm_hfdjjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,crm_hfdjjl.hfrq,hflxmc,DECODE(crm_hfdjjl.hfdjbz,'1','���̻طö���','2','Ͷ�߱��޻طö���','3','ȫ������'),crm_hfdjjl.djyy,crm_hfdjjl.djsj,crm_hfdjjl.djr,crm_hfdjjl.jhjdsj,crm_hfdjjl.sjjdsj,crm_hfdjjl.jdr ";
	ls_sql+=" FROM crm_hfdjjl,crm_khxx,sq_sgd,dm_hflxbm  ";
    ls_sql+=" where crm_hfdjjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_hfdjjl.djsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_hfdjjlCxList.jsp","SelectCxCrm_hfdjjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"crm_hfdjjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm","djbh","crm_hfdjjl_hfdjbz","crm_hfdjjl_djyy","crm_hfdjjl_djsj","crm_hfdjjl_djr","crm_hfdjjl_jhjdsj","crm_hfdjjl_sjjdsj","crm_hfdjjl_jdr","crm_hfdjjl_hfrq","crm_hfdjjl_hflxbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">������</td>
	<td  width="5%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�</td>
	<td  width="6%">���̻ط�����</td>
	<td  width="6%">���̻ط�����</td>
	<td  width="6%">�طö����־</td>
	<td  width="16%">����ԭ��</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">������</td>
	<td  width="6%">�ƻ��ⶳʱ��</td>
	<td  width="6%">ʵ�ʽⶳʱ��</td>
	<td  width="4%">�ⶳ��</td>
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