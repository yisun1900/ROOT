<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jxc_gyshtxx_htbh=null;
	String jxc_gyshtxx_dqbm=null;
	String jxc_gyshtxx_gysmc=null;
	String jxc_gyshtxx_gysdz=null;
	String jxc_gyshtxx_gysfzr=null;
	String jxc_gyshtxx_gysdh=null;
	String jxc_gyshtxx_gyscz=null;
	String jxc_gyshtxx_kssj=null;
	String jxc_gyshtxx_jssj=null;
	String jxc_gyshtxx_lrbz=null;
	jxc_gyshtxx_htbh=request.getParameter("jxc_gyshtxx_htbh");
	if (jxc_gyshtxx_htbh!=null)
	{
		jxc_gyshtxx_htbh=cf.GB2Uni(jxc_gyshtxx_htbh);
		if (!(jxc_gyshtxx_htbh.equals("")))	wheresql+=" and  (jxc_gyshtxx.htbh='"+jxc_gyshtxx_htbh+"')";
	}
	jxc_gyshtxx_dqbm=request.getParameter("jxc_gyshtxx_dqbm");
	if (jxc_gyshtxx_dqbm!=null)
	{
		jxc_gyshtxx_dqbm=cf.GB2Uni(jxc_gyshtxx_dqbm);
		if (!(jxc_gyshtxx_dqbm.equals("")))	wheresql+=" and  (jxc_gyshtxx.dqbm='"+jxc_gyshtxx_dqbm+"')";
	}
	jxc_gyshtxx_gysmc=request.getParameter("jxc_gyshtxx_gysmc");
	if (jxc_gyshtxx_gysmc!=null)
	{
		jxc_gyshtxx_gysmc=cf.GB2Uni(jxc_gyshtxx_gysmc);
		if (!(jxc_gyshtxx_gysmc.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysmc like '%"+jxc_gyshtxx_gysmc+"%')";
	}
	jxc_gyshtxx_gysdz=request.getParameter("jxc_gyshtxx_gysdz");
	if (jxc_gyshtxx_gysdz!=null)
	{
		jxc_gyshtxx_gysdz=cf.GB2Uni(jxc_gyshtxx_gysdz);
		if (!(jxc_gyshtxx_gysdz.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysdz='"+jxc_gyshtxx_gysdz+"')";
	}
	jxc_gyshtxx_gysfzr=request.getParameter("jxc_gyshtxx_gysfzr");
	if (jxc_gyshtxx_gysfzr!=null)
	{
		jxc_gyshtxx_gysfzr=cf.GB2Uni(jxc_gyshtxx_gysfzr);
		if (!(jxc_gyshtxx_gysfzr.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysfzr='"+jxc_gyshtxx_gysfzr+"')";
	}
	jxc_gyshtxx_gysdh=request.getParameter("jxc_gyshtxx_gysdh");
	if (jxc_gyshtxx_gysdh!=null)
	{
		jxc_gyshtxx_gysdh=cf.GB2Uni(jxc_gyshtxx_gysdh);
		if (!(jxc_gyshtxx_gysdh.equals("")))	wheresql+=" and  (jxc_gyshtxx.gysdh='"+jxc_gyshtxx_gysdh+"')";
	}
	jxc_gyshtxx_gyscz=request.getParameter("jxc_gyshtxx_gyscz");
	if (jxc_gyshtxx_gyscz!=null)
	{
		jxc_gyshtxx_gyscz=cf.GB2Uni(jxc_gyshtxx_gyscz);
		if (!(jxc_gyshtxx_gyscz.equals("")))	wheresql+=" and  (jxc_gyshtxx.gyscz='"+jxc_gyshtxx_gyscz+"')";
	}
	jxc_gyshtxx_kssj=request.getParameter("jxc_gyshtxx_kssj");
	if (jxc_gyshtxx_kssj!=null)
	{
		jxc_gyshtxx_kssj=jxc_gyshtxx_kssj.trim();
		if (!(jxc_gyshtxx_kssj.equals("")))	wheresql+="  and (jxc_gyshtxx.kssj>=TO_DATE('"+jxc_gyshtxx_kssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_kssj=request.getParameter("jxc_gyshtxx_kssj2");
	if (jxc_gyshtxx_kssj!=null)
	{
		jxc_gyshtxx_kssj=jxc_gyshtxx_kssj.trim();
		if (!(jxc_gyshtxx_kssj.equals("")))	wheresql+="  and (jxc_gyshtxx.kssj<=TO_DATE('"+jxc_gyshtxx_kssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_jssj=request.getParameter("jxc_gyshtxx_jssj");
	if (jxc_gyshtxx_jssj!=null)
	{
		jxc_gyshtxx_jssj=jxc_gyshtxx_jssj.trim();
		if (!(jxc_gyshtxx_jssj.equals("")))	wheresql+="  and (jxc_gyshtxx.jssj>=TO_DATE('"+jxc_gyshtxx_jssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_jssj=request.getParameter("jxc_gyshtxx_jssj2");
	if (jxc_gyshtxx_jssj!=null)
	{
		jxc_gyshtxx_jssj=jxc_gyshtxx_jssj.trim();
		if (!(jxc_gyshtxx_jssj.equals("")))	wheresql+="  and (jxc_gyshtxx.jssj<=TO_DATE('"+jxc_gyshtxx_jssj+"','YYYY/MM/DD'))";
	}
	jxc_gyshtxx_lrbz=request.getParameter("jxc_gyshtxx_lrbz");
	if (jxc_gyshtxx_lrbz!=null)
	{
		jxc_gyshtxx_lrbz=cf.GB2Uni(jxc_gyshtxx_lrbz);
		if (!(jxc_gyshtxx_lrbz.equals("")))	wheresql+=" and  (jxc_gyshtxx.lrbz='"+jxc_gyshtxx_lrbz+"')";
	}
	ls_sql="SELECT jxc_gyshtxx.htbh,dm_dqbm.dqmc,jxc_gyshtxx.gysmc,jxc_gyshtxx.gysdz,jxc_gyshtxx.gysfzr,jxc_gyshtxx.gysdh,jxc_gyshtxx.gyscz,jxc_gyshtxx.kssj,jxc_gyshtxx.jssj, DECODE(jxc_gyshtxx.lrbz,'Y','¼��','N','δ¼��'),jxc_gyshtxx.bz  ";
	ls_sql+=" FROM dm_dqbm,jxc_gyshtxx  ";
    ls_sql+=" where jxc_gyshtxx.dqbm=dm_dqbm.dqbm(+)";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_gyshtxx.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and jxc_gyshtxx.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_gyshtxx.dqbm,jxc_gyshtxx.gysmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_gyshtxxList.jsp","","","EditJxc_gyshtxx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"htbh","dm_dqbm_dqmc","jxc_gyshtxx_gysmc","jxc_gyshtxx_gysdz","jxc_gyshtxx_gysfzr","jxc_gyshtxx_gysdh","jxc_gyshtxx_gyscz","jxc_gyshtxx_kssj","jxc_gyshtxx_jssj","jxc_gyshtxx_lrbz","jxc_gyshtxx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"htbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_gyshtxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] htbh = request.getParameterValues("htbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(htbh,"htbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_gyshtxx where "+chooseitem;
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
  <B><font size="3">��Ӧ�̺�ͬ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">��ͬ���</td>
	<td  width="5%">��������</td>
	<td  width="14%">��Ӧ������</td>
	<td  width="14%">��Ӧ�̵�ַ</td>
	<td  width="5%">��Ӧ�̸�����</td>
	<td  width="12%">��Ӧ�̵绰</td>
	<td  width="8%">��Ӧ�̴���</td>
	<td  width="6%">��ͬ��ʼʱ��</td>
	<td  width="6%">��ͬ����ʱ��</td>
	<td  width="5%">¼���־</td>
	<td  width="48%">��ע</td>
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