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
	String jsjlh=null;
	String jssj=null;
	String jsr=null;

 	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (jc_gysjs.ssfgs='"+fgs+"')";

	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (jc_gysjs.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_gysjs.ppbm like '%"+ppbm2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_gysjs.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_gysjs.gys like '%"+gys2+"%')";
	}

	
	
	String fkr=null;
	fkr=request.getParameter("fkr");
	if (fkr!=null)
	{
		fkr=cf.GB2Uni(fkr);
		if (!(fkr.equals("")))	wheresql+=" and  (jc_gysjs.fkr='"+fkr+"')";
	}
	String fksj=null;
	fksj=request.getParameter("fksj");
	if (fksj!=null)
	{
		fksj=fksj.trim();
		if (!(fksj.equals("")))	wheresql+="  and (jc_gysjs.fksj>=TO_DATE('"+fksj+"','YYYY/MM/DD'))";
	}
	fksj=request.getParameter("fksj2");
	if (fksj!=null)
	{
		fksj=fksj.trim();
		if (!(fksj.equals("")))	wheresql+="  and (jc_gysjs.fksj<=TO_DATE('"+fksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String cwzq=null;
	cwzq=request.getParameter("cwzq");
	if (cwzq!=null)
	{
		cwzq=cf.GB2Uni(cwzq);
		if (!(cwzq.equals("")))	wheresql+=" and  (jc_gysjs.cwzq like '%"+cwzq+"%')";
	}

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+=" and  (jc_gysjs.shbz='"+shbz+"')";
	}
	
	
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=jsjlh.trim();
		if (!(jsjlh.equals("")))	wheresql+=" and (jsjlh="+jsjlh+") ";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jsr='"+jsr+"')";
	}
	
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	String shr=null;
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}

	ls_sql="SELECT jsjlh,DECODE(shbz,'N','δ���','Y','���','F','���㸶��'),gys,ppbm,jssj,jsr,kcfy,jsje,cbzj,ycfzj,qtfzj,(select sum(hkze) from jc_zcdd,jc_gysjsmx where jc_zcdd.ddbh=jc_gysjsmx.ddbh and jc_gysjsmx.jsjlh=jc_gysjs.jsjlh ),jssm,shr,shsj,fkr,fksj,fksm,dwmc  ";
	ls_sql+=" FROM jc_gysjs,sq_dwxx  ";
    ls_sql+=" where  jc_gysjs.ssfgs=sq_dwxx.dwbh and jc_gysjs.lx='1'";//1��������2����������
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_gysjs.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_gysjs.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_gysjs.ssfgs,jc_gysjs.jsjlh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Jc_gysjsFkList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","gys","jssj","jsr","cbzj","ycfzj","qtfzj","kcfy","jsje","jssm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"��������"};//��ť����ʾ����
	String[] buttonLink={"SavePlFk.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="dy.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">���㵥����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">�����¼��</td>
	<td  width="3%">��˱�־</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="5%">Ʒ��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">������</td>
	<td  width="4%">�۳�����</td>
	<td  width="5%">������</td>
	<td  width="5%">���ϳɱ�</td>
	<td  width="4%">Զ�̷�</td>
	<td  width="4%">������</td>
	<td  width="5%">��ͬ���</td>
	<td  width="15%">����˵��</td>
	<td  width="3%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="11%">����˵��</td>
	<td  width="6%">������˾</td>
</tr>
<%
	pageObj.displayDateSum();
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