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
	String crm_hddj_khbh=null;
	String crm_hddj_khxm=null;
	String crm_hddj_xb=null;
	String crm_hddj_lxfs=null;
	String crm_hddj_cqbm=null;
	String crm_hddj_fwdz=null;
	String crm_hddj_cgdz=null;
	String crm_hddj_hdsgd=null;
	String crm_hddj_hdsgbz=null;
	String crm_hddj_hdsjs=null;
	String crm_hddj_lrr=null;
	String crm_hddj_lrsj=null;
	crm_hddj_khbh=request.getParameter("crm_hddj_khbh");
	if (crm_hddj_khbh!=null)
	{
		crm_hddj_khbh=cf.GB2Uni(crm_hddj_khbh);
		if (!(crm_hddj_khbh.equals("")))	wheresql+=" and  (crm_hddj.khbh='"+crm_hddj_khbh+"')";
	}
	crm_hddj_khxm=request.getParameter("crm_hddj_khxm");
	if (crm_hddj_khxm!=null)
	{
		crm_hddj_khxm=cf.GB2Uni(crm_hddj_khxm);
		if (!(crm_hddj_khxm.equals("")))	wheresql+=" and  (crm_hddj.khxm='"+crm_hddj_khxm+"')";
	}
	crm_hddj_xb=request.getParameter("crm_hddj_xb");
	if (crm_hddj_xb!=null)
	{
		crm_hddj_xb=cf.GB2Uni(crm_hddj_xb);
		if (!(crm_hddj_xb.equals("")))	wheresql+=" and  (crm_hddj.xb='"+crm_hddj_xb+"')";
	}
	crm_hddj_lxfs=request.getParameter("crm_hddj_lxfs");
	if (crm_hddj_lxfs!=null)
	{
		crm_hddj_lxfs=cf.GB2Uni(crm_hddj_lxfs);
		if (!(crm_hddj_lxfs.equals("")))	wheresql+=" and  (crm_hddj.lxfs='"+crm_hddj_lxfs+"')";
	}
	crm_hddj_cqbm=request.getParameter("crm_hddj_cqbm");
	if (crm_hddj_cqbm!=null)
	{
		crm_hddj_cqbm=cf.GB2Uni(crm_hddj_cqbm);
		if (!(crm_hddj_cqbm.equals("")))	wheresql+=" and  (crm_hddj.cqbm='"+crm_hddj_cqbm+"')";
	}
	crm_hddj_fwdz=request.getParameter("crm_hddj_fwdz");
	if (crm_hddj_fwdz!=null)
	{
		crm_hddj_fwdz=cf.GB2Uni(crm_hddj_fwdz);
		if (!(crm_hddj_fwdz.equals("")))	wheresql+=" and  (crm_hddj.fwdz like '%"+crm_hddj_fwdz+"%')";
	}
	crm_hddj_cgdz=request.getParameter("crm_hddj_cgdz");
	if (crm_hddj_cgdz!=null)
	{
		crm_hddj_cgdz=cf.GB2Uni(crm_hddj_cgdz);
		if (!(crm_hddj_cgdz.equals("")))	wheresql+=" and  (crm_hddj.cgdz like '%"+crm_hddj_cgdz+"%')";
	}
	crm_hddj_hdsgd=request.getParameter("crm_hddj_hdsgd");
	if (crm_hddj_hdsgd!=null)
	{
		crm_hddj_hdsgd=cf.GB2Uni(crm_hddj_hdsgd);
		if (!(crm_hddj_hdsgd.equals("")))	wheresql+=" and  (crm_hddj.hdsgd='"+crm_hddj_hdsgd+"')";
	}
	crm_hddj_hdsgbz=request.getParameter("crm_hddj_hdsgbz");
	if (crm_hddj_hdsgbz!=null)
	{
		crm_hddj_hdsgbz=cf.GB2Uni(crm_hddj_hdsgbz);
		if (!(crm_hddj_hdsgbz.equals("")))	wheresql+=" and  (crm_hddj.hdsgbz='"+crm_hddj_hdsgbz+"')";
	}
	crm_hddj_hdsjs=request.getParameter("crm_hddj_hdsjs");
	if (crm_hddj_hdsjs!=null)
	{
		crm_hddj_hdsjs=cf.GB2Uni(crm_hddj_hdsjs);
		if (!(crm_hddj_hdsjs.equals("")))	wheresql+=" and  (crm_hddj.hdsjs='"+crm_hddj_hdsjs+"')";
	}
	crm_hddj_lrr=request.getParameter("crm_hddj_lrr");
	if (crm_hddj_lrr!=null)
	{
		crm_hddj_lrr=cf.GB2Uni(crm_hddj_lrr);
		if (!(crm_hddj_lrr.equals("")))	wheresql+=" and  (crm_hddj.lrr='"+crm_hddj_lrr+"')";
	}
	crm_hddj_lrsj=request.getParameter("crm_hddj_lrsj");
	if (crm_hddj_lrsj!=null)
	{
		crm_hddj_lrsj=crm_hddj_lrsj.trim();
		if (!(crm_hddj_lrsj.equals("")))	wheresql+="  and (crm_hddj.lrsj>=TO_DATE('"+crm_hddj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_hddj_lrsj=request.getParameter("crm_hddj_lrsj2");
	if (crm_hddj_lrsj!=null)
	{
		crm_hddj_lrsj=crm_hddj_lrsj.trim();
		if (!(crm_hddj_lrsj.equals("")))	wheresql+="  and (crm_hddj.lrsj<=TO_DATE('"+crm_hddj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_hddj.khbh,crm_hddj.khxm, DECODE(crm_hddj.xb,'M','��','W','Ů'),crm_hddj.lxfs,dm_cqbm.cqmc,crm_hddj.fwdz,crm_hddj.cgdz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM crm_hddj,dm_cqbm,sq_dwxx  ";
    ls_sql+=" where crm_hddj.cqbm=dm_cqbm.cqbm(+) and crm_hddj.hdsgd=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by khbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_hddjList.jsp","SelectCrm_hddj.jsp","","EditCrm_hddj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_hddj_khxm","crm_hddj_xb","crm_hddj_lxfs","dm_cqbm_cqmc","crm_hddj_fwdz","crm_hddj_cgdz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_hddjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_hddj.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_hddj where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">�ͻ����</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="6%">�Ա�</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="10%">��������</td>
	<td  width="20%">��װ�޵�ַ</td>
	<td  width="18%">�ص�װ�޵�ַ</td>
	<td  width="8%">�ص�ʩ����</td>
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