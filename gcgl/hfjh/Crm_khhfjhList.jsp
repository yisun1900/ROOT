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
	String crm_khhfjh_khbh=null;
	String crm_khhfjh_xchfrq=null;
	String crm_khhfjh_hflxbm=null;
	String crm_khhfjh_khxm=null;
	String crm_khhfjh_xb=null;
	String crm_khhfjh_fwdz=null;
	String crm_khhfjh_lxfs=null;
	String crm_khhfjh_clzt=null;
	crm_khhfjh_khbh=request.getParameter("crm_khhfjh_khbh");
	if (crm_khhfjh_khbh!=null)
	{
		crm_khhfjh_khbh=cf.GB2Uni(crm_khhfjh_khbh);
		if (!(crm_khhfjh_khbh.equals("")))	wheresql+=" and  (crm_khhfjh.khbh='"+crm_khhfjh_khbh+"')";
	}
	crm_khhfjh_xchfrq=request.getParameter("crm_khhfjh_xchfrq");
	if (crm_khhfjh_xchfrq!=null)
	{
		crm_khhfjh_xchfrq=crm_khhfjh_xchfrq.trim();
		if (!(crm_khhfjh_xchfrq.equals("")))	wheresql+="  and (crm_khhfjh.xchfrq>=TO_DATE('"+crm_khhfjh_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_khhfjh_xchfrq=request.getParameter("crm_khhfjh_xchfrq2");
	if (crm_khhfjh_xchfrq!=null)
	{
		crm_khhfjh_xchfrq=crm_khhfjh_xchfrq.trim();
		if (!(crm_khhfjh_xchfrq.equals("")))	wheresql+="  and (crm_khhfjh.xchfrq<=TO_DATE('"+crm_khhfjh_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_khhfjh_hflxbm=request.getParameter("crm_khhfjh_hflxbm");
	if (crm_khhfjh_hflxbm!=null)
	{
		crm_khhfjh_hflxbm=cf.GB2Uni(crm_khhfjh_hflxbm);
		if (!(crm_khhfjh_hflxbm.equals("")))	wheresql+=" and  (crm_khhfjh.hflxbm='"+crm_khhfjh_hflxbm+"')";
	}
	crm_khhfjh_khxm=request.getParameter("crm_khhfjh_khxm");
	if (crm_khhfjh_khxm!=null)
	{
		crm_khhfjh_khxm=cf.GB2Uni(crm_khhfjh_khxm);
		if (!(crm_khhfjh_khxm.equals("")))	wheresql+=" and  (crm_khhfjh.khxm='"+crm_khhfjh_khxm+"')";
	}
	crm_khhfjh_xb=request.getParameter("crm_khhfjh_xb");
	if (crm_khhfjh_xb!=null)
	{
		crm_khhfjh_xb=cf.GB2Uni(crm_khhfjh_xb);
		if (!(crm_khhfjh_xb.equals("")))	wheresql+=" and  (crm_khhfjh.xb='"+crm_khhfjh_xb+"')";
	}
	crm_khhfjh_fwdz=request.getParameter("crm_khhfjh_fwdz");
	if (crm_khhfjh_fwdz!=null)
	{
		crm_khhfjh_fwdz=cf.GB2Uni(crm_khhfjh_fwdz);
		if (!(crm_khhfjh_fwdz.equals("")))	wheresql+=" and  (crm_khhfjh.fwdz='"+crm_khhfjh_fwdz+"')";
	}
	crm_khhfjh_lxfs=request.getParameter("crm_khhfjh_lxfs");
	if (crm_khhfjh_lxfs!=null)
	{
		crm_khhfjh_lxfs=cf.GB2Uni(crm_khhfjh_lxfs);
		if (!(crm_khhfjh_lxfs.equals("")))	wheresql+=" and  (crm_khhfjh.lxfs='"+crm_khhfjh_lxfs+"')";
	}
	crm_khhfjh_clzt=request.getParameter("crm_khhfjh_clzt");
	if (crm_khhfjh_clzt!=null)
	{
		crm_khhfjh_clzt=cf.GB2Uni(crm_khhfjh_clzt);
		if (!(crm_khhfjh_clzt.equals("")))	wheresql+=" and  (crm_khhfjh.clzt='"+crm_khhfjh_clzt+"')";
	}
	ls_sql="SELECT crm_khhfjh.khbh as khbh,crm_khhfjh.xchfrq as xchfrq,dm_hflxbm.hflxmc as dm_hflxbm_hflxmc,crm_khhfjh.khxm as crm_khhfjh_khxm, DECODE(crm_khhfjh.xb,'M','��','W','Ů') as crm_khhfjh_xb,crm_khhfjh.fwdz as crm_khhfjh_fwdz,crm_khhfjh.lxfs as crm_khhfjh_lxfs, DECODE(crm_khhfjh.clzt,'N','δ�ط�','Y','�ѻط�') as crm_khhfjh_clzt  ";
	ls_sql+=" FROM crm_khhfjh,dm_hflxbm  ";
    ls_sql+=" where crm_khhfjh.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khhfjhList.jsp","SelectCrm_khhfjh.jsp","","EditCrm_khhfjh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","xchfrq","dm_hflxbm_hflxmc","crm_khhfjh_khxm","crm_khhfjh_xb","crm_khhfjh_fwdz","crm_khhfjh_lxfs","crm_khhfjh_clzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","xchfrq"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_khhfjhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_khhfjh where "+chooseitem;
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
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="11%">�ͻ����</td>
	<td  width="13%">�ط�����</td>
	<td  width="14%">�ط�����</td>
	<td  width="10%">����</td>
	<td  width="6%">�Ա�</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="11%">��ϵ��ʽ</td>
	<td  width="7%">״̬</td>
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