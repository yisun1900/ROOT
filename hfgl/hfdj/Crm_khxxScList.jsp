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
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_djyy=null;
	String crm_khxx_djsj=null;
	String crm_khxx_djr=null;
	String crm_khxx_jhjdsj=null;

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


	String hfdjbz=null;
	hfdjbz=request.getParameter("hfdjbz");
	if (hfdjbz!=null)
	{
		if (!(hfdjbz.equals("")))	wheresql+=" and  (crm_khxx.hfdjbz='"+hfdjbz+"')";
	}

	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
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
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_djyy=request.getParameter("crm_khxx_djyy");
	if (crm_khxx_djyy!=null)
	{
		crm_khxx_djyy=cf.GB2Uni(crm_khxx_djyy);
		if (!(crm_khxx_djyy.equals("")))	wheresql+=" and  (crm_khxx.djyy like '%"+crm_khxx_djyy+"%')";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj>=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djsj=request.getParameter("crm_khxx_djsj2");
	if (crm_khxx_djsj!=null)
	{
		crm_khxx_djsj=crm_khxx_djsj.trim();
		if (!(crm_khxx_djsj.equals("")))	wheresql+="  and (crm_khxx.djsj<=TO_DATE('"+crm_khxx_djsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_djr=request.getParameter("crm_khxx_djr");
	if (crm_khxx_djr!=null)
	{
		crm_khxx_djr=cf.GB2Uni(crm_khxx_djr);
		if (!(crm_khxx_djr.equals("")))	wheresql+=" and  (crm_khxx.djr='"+crm_khxx_djr+"')";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj>=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_jhjdsj=request.getParameter("crm_khxx_jhjdsj2");
	if (crm_khxx_jhjdsj!=null)
	{
		crm_khxx_jhjdsj=crm_khxx_jhjdsj.trim();
		if (!(crm_khxx_jhjdsj.equals("")))	wheresql+="  and (crm_khxx.jhjdsj<=TO_DATE('"+crm_khxx_jhjdsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz, DECODE(crm_khxx.hfdjbz,'0','δ����','1','���̻طö���','2','Ͷ�߱��޻طö���','3','ȫ������'),crm_khxx.djsj,crm_khxx.djr,crm_khxx.jhjdsj,crm_khxx.djyy,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.zjxm,sgdmc ";
	ls_sql+=" FROM crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.hfdjbz!='0'";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.djsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxScList.jsp","SelectScCrm_khxx.jsp","","DeleteCrm_hfdjjl.jsp");
	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[7]="align='left'";
	pageObj.setEditStr("ɾ��");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="7%">�طö����־</td>
	<td  width="7%">����ʱ��</td>
	<td  width="4%">������</td>
	<td  width="7%">�ƻ��ⶳʱ��</td>
	<td  width="25%">����ԭ��</td>
	<td  width="11%">��ϵ��ʽ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ʼ�</td>
	<td  width="4%">ʩ����</td>
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