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
	String gysbm=null;
	String dqbm=null;
	String gysmc=null;
	String gysdz=null;
	String gysfzr=null;
	String gysdh=null;
	String gyscz=null;
	String email=null;
	String gyslx=null;
	String sfhz=null;

	String cllx=null;
	cllx=request.getParameter("cllx");
	if (cllx!=null)
	{
		cllx=cf.GB2Uni(cllx);
		if (!(cllx.equals("")))	wheresql+=" and  (cllx='"+cllx+"')";
	}
	
	
	sfhz=request.getParameter("sfhz");
	if (sfhz!=null)
	{
		sfhz=sfhz.trim();
		if (!(sfhz.equals("")))	wheresql+=" and (sfhz='"+sfhz+"') ";
	}
	gyslx=request.getParameter("gyslx");
	if (gyslx!=null)
	{
		gyslx=gyslx.trim();
		if (!(gyslx.equals("")))	wheresql+=" and (gyslx="+gyslx+") ";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (gysbm="+gysbm+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_gysxx.dqbm='"+dqbm+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc like '%"+gysmc+"%')";
	}
	gysdz=request.getParameter("gysdz");
	if (gysdz!=null)
	{
		gysdz=cf.GB2Uni(gysdz);
		if (!(gysdz.equals("")))	wheresql+=" and   (gysdz like '%"+gysdz+"%')";
	}
	gysfzr=request.getParameter("gysfzr");
	if (gysfzr!=null)
	{
		gysfzr=cf.GB2Uni(gysfzr);
		if (!(gysfzr.equals("")))	wheresql+=" and  (gysfzr='"+gysfzr+"')";
	}
	gysdh=request.getParameter("gysdh");
	if (gysdh!=null)
	{
		gysdh=cf.GB2Uni(gysdh);
		if (!(gysdh.equals("")))	wheresql+=" and  (gysdh='"+gysdh+"')";
	}
	gyscz=request.getParameter("gyscz");
	if (gyscz!=null)
	{
		gyscz=cf.GB2Uni(gyscz);
		if (!(gyscz.equals("")))	wheresql+=" and  (gyscz='"+gyscz+"')";
	}
	email=request.getParameter("email");
	if (email!=null)
	{
		email=cf.GB2Uni(email);
		if (!(email.equals("")))	wheresql+=" and  (email='"+email+"')";
	}

	String cwdm=null;
	cwdm=request.getParameter("cwdm");
	if (cwdm!=null)
	{
		cwdm=cf.GB2Uni(cwdm);
		if (!(cwdm.equals("")))	wheresql+=" and  (cwdm='"+cwdm+"')";
	}

	ls_sql="SELECT gysbm,dqmc,gysmc,DECODE(gyslx,'0','����Ʒ������','1','��湩����','2','���ù�����') gyslx,DECODE(cllx,'1','����','2','����','3','���ļ�����') cllx,DECODE(sfhz,'Y','����','N','������') sfhz,gysdz,gysfzr,gysdh,gyscz,email,cwdm,DECODE(bz,'','',substr(bz,0,8)||'......') bz  ";
	ls_sql+=" FROM jxc_gysxx,dm_dqbm  ";
    ls_sql+=" where jxc_gysxx.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_gysxx.dqbm,jxc_gysxx.gysmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_gysxxList.jsp","","","EditJxc_gysxx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gysbm","dqbm","gysmc","gysdz","gysfzr","gysdh","gyscz","email","yhdlm","yhkl","yhmc","cwdm","kdlxtbz","lxdlsbcs","mmxgsj","mmsyzq","yxdlsbcs","sfsd","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_gysxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gysbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_gysxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] gysbm = request.getParameterValues("gysbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gysbm,"gysbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[3];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jxc_gyslxr where "+chooseitem;
		sql[1]="delete from jxc_gysxx where "+chooseitem;
		sql[2]="delete from jxc_ppgysdzb where "+chooseitem;
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
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">��Ӧ�̱���</td>
	<td  width="3%">��������</td>
	<td  width="11%">��Ӧ������</td>
	<td  width="4%">��Ӧ������</td>
	<td  width="3%">��Ӧ��������</td>
	<td  width="3%">�Ƿ����</td>
	<td  width="10%">��Ӧ�̵�ַ</td>
	<td  width="3%">��Ӧ�̸�����</td>
	<td  width="8%">��Ӧ�̵绰</td>
	<td  width="6%">��Ӧ�̴���</td>
	<td  width="6%">EMail</td>
	<td  width="3%">�������</td>
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