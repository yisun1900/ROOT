<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jxc_db_dbph=null;
	String jxc_db_dbcllx=null;
	String jxc_db_dbyy=null;
	String jxc_db_dcdq=null;
	String jxc_db_dcgs=null;
	String jxc_db_drdq=null;
	String jxc_db_drgs=null;
	String jxc_db_jgzyk=null;
	String jxc_db_djck=null;
	String jxc_db_shr=null;
	String jxc_db_shrq=null;
	String jxc_db_dbdzt=null;
	String jxc_db_lrr=null;
	String jxc_db_lrsj=null;
	jxc_db_dbph=request.getParameter("jxc_db_dbph");
	if (jxc_db_dbph!=null)
	{
		jxc_db_dbph=cf.GB2Uni(jxc_db_dbph);
		if (!(jxc_db_dbph.equals("")))	wheresql+=" and  (jxc_db.dbph='"+jxc_db_dbph+"')";
	}
	jxc_db_dbcllx=request.getParameter("jxc_db_dbcllx");
	if (jxc_db_dbcllx!=null)
	{
		jxc_db_dbcllx=cf.GB2Uni(jxc_db_dbcllx);
		if (!(jxc_db_dbcllx.equals("")))	wheresql+=" and  (jxc_db.dbcllx='"+jxc_db_dbcllx+"')";
	}
	jxc_db_dbyy=request.getParameter("jxc_db_dbyy");
	if (jxc_db_dbyy!=null)
	{
		jxc_db_dbyy=cf.GB2Uni(jxc_db_dbyy);
		if (!(jxc_db_dbyy.equals("")))	wheresql+=" and  (jxc_db.dbyy='"+jxc_db_dbyy+"')";
	}
	jxc_db_dcdq=request.getParameter("jxc_db_dcdq");
	if (jxc_db_dcdq!=null)
	{
		jxc_db_dcdq=cf.GB2Uni(jxc_db_dcdq);
		if (!(jxc_db_dcdq.equals("")))	wheresql+=" and  (jxc_db.dcdq='"+jxc_db_dcdq+"')";
	}
	jxc_db_dcgs=request.getParameter("jxc_db_dcgs");
	if (jxc_db_dcgs!=null)
	{
		jxc_db_dcgs=cf.GB2Uni(jxc_db_dcgs);
		if (!(jxc_db_dcgs.equals("")))	wheresql+=" and  (jxc_db.dcgs='"+jxc_db_dcgs+"')";
	}
	jxc_db_drdq=request.getParameter("jxc_db_drdq");
	if (jxc_db_drdq!=null)
	{
		jxc_db_drdq=cf.GB2Uni(jxc_db_drdq);
		if (!(jxc_db_drdq.equals("")))	wheresql+=" and  (jxc_db.drdq='"+jxc_db_drdq+"')";
	}
	jxc_db_drgs=request.getParameter("jxc_db_drgs");
	if (jxc_db_drgs!=null)
	{
		jxc_db_drgs=cf.GB2Uni(jxc_db_drgs);
		if (!(jxc_db_drgs.equals("")))	wheresql+=" and  (jxc_db.drgs='"+jxc_db_drgs+"')";
	}
	jxc_db_jgzyk=request.getParameter("jxc_db_jgzyk");
	if (jxc_db_jgzyk!=null)
	{
		jxc_db_jgzyk=cf.GB2Uni(jxc_db_jgzyk);
		if (!(jxc_db_jgzyk.equals("")))	wheresql+=" and  (jxc_db.jgzyk='"+jxc_db_jgzyk+"')";
	}
	jxc_db_djck=request.getParameter("jxc_db_djck");
	if (jxc_db_djck!=null)
	{
		jxc_db_djck=cf.GB2Uni(jxc_db_djck);
		if (!(jxc_db_djck.equals("")))	wheresql+=" and  (jxc_db.djck='"+jxc_db_djck+"')";
	}
	jxc_db_shr=request.getParameter("jxc_db_shr");
	if (jxc_db_shr!=null)
	{
		jxc_db_shr=cf.GB2Uni(jxc_db_shr);
		if (!(jxc_db_shr.equals("")))	wheresql+=" and  (jxc_db.shr='"+jxc_db_shr+"')";
	}
	jxc_db_shrq=request.getParameter("jxc_db_shrq");
	if (jxc_db_shrq!=null)
	{
		jxc_db_shrq=jxc_db_shrq.trim();
		if (!(jxc_db_shrq.equals("")))	wheresql+="  and (jxc_db.shrq>=TO_DATE('"+jxc_db_shrq+"','YYYY/MM/DD'))";
	}
	jxc_db_shrq=request.getParameter("jxc_db_shrq2");
	if (jxc_db_shrq!=null)
	{
		jxc_db_shrq=jxc_db_shrq.trim();
		if (!(jxc_db_shrq.equals("")))	wheresql+="  and (jxc_db.shrq<=TO_DATE('"+jxc_db_shrq+"','YYYY/MM/DD'))";
	}
	jxc_db_dbdzt=request.getParameter("jxc_db_dbdzt");
	if (jxc_db_dbdzt!=null)
	{
		jxc_db_dbdzt=cf.GB2Uni(jxc_db_dbdzt);
		if (!(jxc_db_dbdzt.equals("")))	wheresql+=" and  (jxc_db.dbdzt='"+jxc_db_dbdzt+"')";
	}
	jxc_db_lrr=request.getParameter("jxc_db_lrr");
	if (jxc_db_lrr!=null)
	{
		jxc_db_lrr=cf.GB2Uni(jxc_db_lrr);
		if (!(jxc_db_lrr.equals("")))	wheresql+=" and  (jxc_db.lrr='"+jxc_db_lrr+"')";
	}
	jxc_db_lrsj=request.getParameter("jxc_db_lrsj");
	if (jxc_db_lrsj!=null)
	{
		jxc_db_lrsj=jxc_db_lrsj.trim();
		if (!(jxc_db_lrsj.equals("")))	wheresql+="  and (jxc_db.lrsj>=TO_DATE('"+jxc_db_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_db_lrsj=request.getParameter("jxc_db_lrsj2");
	if (jxc_db_lrsj!=null)
	{
		jxc_db_lrsj=jxc_db_lrsj.trim();
		if (!(jxc_db_lrsj.equals("")))	wheresql+="  and (jxc_db.lrsj<=TO_DATE('"+jxc_db_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_db.dbph,DECODE(jxc_db.dbdzt,'0','δ�ύ','1','�ύ�ȴ����','2','���ͨ���ȴ�����','3','�ѳ���ȴ����','7','���δͨ��','9','������'), DECODE(jxc_db.dbcllx,'0','����','1','����'), DECODE(jxc_db.dbyy,'0','���ŵ���','1','�˻�����'),c.dqmc dcdq,a.dwmc dcgs,d.dqmc drdq,b.dwmc drgs,jxc_db.dbzsl, DECODE(jxc_db.jgzyk,'N','������','Y','����'),ckmc,jxc_db.shr,jxc_db.shrq,jxc_db.shyj,jxc_db.lrr,jxc_db.lrsj,e.dwmc lrbm,jxc_db.bz  ";
	ls_sql+=" FROM jxc_db,sq_dwxx a,sq_dwxx b,dm_dqbm c,dm_dqbm d,sq_dwxx e,jxc_ckmc ";
    ls_sql+=" where jxc_db.dcgs=a.dwbh(+) and jxc_db.drgs=b.dwbh(+)";
    ls_sql+=" and jxc_db.dcdq=c.dqbm(+) and jxc_db.drdq=d.dqbm(+)";
    ls_sql+=" and jxc_db.lrbm=e.dwbh(+) ";
    ls_sql+=" and jxc_db.djck=jxc_ckmc.ckbh(+) ";
    ls_sql+=" and jxc_db.dbdzt in('2','7') ";
    ls_sql+=" and jxc_db.dbcllx='1'";//0�����ģ�1������
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_db.dcgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_db.dcgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_db.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_dbXgShList.jsp","","","XgShJxc_db.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"dbph"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("���");
//���ð�ť����
	String[] buttonName={"ɾ�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteShJxc_db.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);



//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dbph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_db.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dbph",coluParm);//�в����������Hash��
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
  <B><font size="3">�����������ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">��������</td>
	<td  width="6%">������״̬</td>
	<td  width="3%">��������</td>
	<td  width="4%">����ԭ��</td>
	<td  width="3%">��������</td>
	<td  width="5%">������˾</td>
	<td  width="3%">�������</td>
	<td  width="5%">���빫˾</td>
	<td  width="4%">����������</td>
	<td  width="4%">�Ƿ񾭹��ܲ������</td>
	<td  width="7%">�����ֿ�</td>
	<td  width="3%">�����</td>
	<td  width="4%">�������</td>
	<td  width="14%">������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="13%">��ע</td>
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