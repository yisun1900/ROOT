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
	String yhdlm=null;
	String yhkl=null;
	String yhmc=null;
	String cwdm=null;
	String kdlxtbz=null;
	String lxdlsbcs=null;
	String mmxgsj=null;
	String mmsyzq=null;
	String yxdlsbcs=null;
	String sfsd=null;
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
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (yhdlm='"+yhdlm+"')";
	}
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (yhkl='"+yhkl+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (yhmc='"+yhmc+"')";
	}
	cwdm=request.getParameter("cwdm");
	if (cwdm!=null)
	{
		cwdm=cf.GB2Uni(cwdm);
		if (!(cwdm.equals("")))	wheresql+=" and  (cwdm='"+cwdm+"')";
	}
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		kdlxtbz=cf.GB2Uni(kdlxtbz);
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (kdlxtbz='"+kdlxtbz+"')";
	}
	lxdlsbcs=request.getParameter("lxdlsbcs");
	if (lxdlsbcs!=null)
	{
		lxdlsbcs=lxdlsbcs.trim();
		if (!(lxdlsbcs.equals("")))	wheresql+=" and (lxdlsbcs="+lxdlsbcs+") ";
	}
	mmxgsj=request.getParameter("mmxgsj");
	if (mmxgsj!=null)
	{
		mmxgsj=mmxgsj.trim();
		if (!(mmxgsj.equals("")))	wheresql+="  and (mmxgsj>=TO_DATE('"+mmxgsj+"','YYYY/MM/DD'))";
	}
	mmxgsj=request.getParameter("mmxgsj2");
	if (mmxgsj!=null)
	{
		mmxgsj=mmxgsj.trim();
		if (!(mmxgsj.equals("")))	wheresql+="  and (mmxgsj<=TO_DATE('"+mmxgsj+"','YYYY/MM/DD'))";
	}
	mmsyzq=request.getParameter("mmsyzq");
	if (mmsyzq!=null)
	{
		mmsyzq=mmsyzq.trim();
		if (!(mmsyzq.equals("")))	wheresql+=" and (mmsyzq>="+mmsyzq+") ";
	}
	mmsyzq=request.getParameter("mmsyzq2");
	if (mmsyzq!=null)
	{
		mmsyzq=mmsyzq.trim();
		if (!(mmsyzq.equals("")))	wheresql+=" and (mmsyzq<="+mmsyzq+") ";
	}
	yxdlsbcs=request.getParameter("yxdlsbcs");
	if (yxdlsbcs!=null)
	{
		yxdlsbcs=yxdlsbcs.trim();
		if (!(yxdlsbcs.equals("")))	wheresql+=" and (yxdlsbcs>="+yxdlsbcs+") ";
	}
	yxdlsbcs=request.getParameter("yxdlsbcs2");
	if (yxdlsbcs!=null)
	{
		yxdlsbcs=yxdlsbcs.trim();
		if (!(yxdlsbcs.equals("")))	wheresql+=" and (yxdlsbcs<="+yxdlsbcs+") ";
	}
	sfsd=request.getParameter("sfsd");
	if (sfsd!=null)
	{
		sfsd=cf.GB2Uni(sfsd);
		if (!(sfsd.equals("")))	wheresql+=" and  (sfsd='"+sfsd+"')";
	}

	ls_sql="SELECT gysbm,dqmc,gysmc,DECODE(gyslx,'0','����Ʒ������','1','��湩����','2','���ù�����') gyslx,DECODE(cllx,'1','����','2','����','3','���ļ�����') cllx,DECODE(sfhz,'Y','����','N','������') sfhz,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhmc,cwdm,DECODE(kdlxtbz,'Y','�ɵ�½','N','���ɵ�½'),lxdlsbcs,mmsyzq,yxdlsbcs,DECODE(sfsd,'Y','������','N','δ����'),DECODE(bz,'','',substr(bz,0,8)||'......') bz  ";
	ls_sql+=" FROM jxc_gysxx,dm_dqbm  ";
    ls_sql+=" where jxc_gysxx.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_gysxx.gysmc";
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
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jxc_gyslxr where "+chooseitem;
		sql[1]="delete from jxc_gysxx where "+chooseitem;
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
	<td  width="4%">�û���¼��</td>
	<td  width="7%">�û�����</td>
	<td  width="3%">�������</td>
	<td  width="3%">�ɵ�½ϵͳ��־</td>
	<td  width="3%">�Ѿ���½ʧ�ܴ���</td>
	<td  width="3%">����ʹ������</td>
	<td  width="3%">�����½ʧ�ܴ���</td>
	<td  width="3%">�Ƿ�����</td>
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