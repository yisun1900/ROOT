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
	String bxxh=null;
	String dwbh=null;
	String fgsbh=null;
	String sqr=null;
	String bxrq=null;
	String jhlqrq=null;
	String dnsbflmc=null;
	String bgr=null;
	String sfyzysj=null;
	String dnsbgzmc=null;
	String gsbh=null;
	String gdzcmc=null;
	String bmbh=null;
	String gdzcflmc=null;
	String xh=null;
	String pp=null;
	String pz1=null;
	String pz2=null;
	String pz3=null;
	String pz4=null;
	String pz5=null;
	String pz6=null;
	String jsr=null;
	String jssj=null;
	String wxr=null;
	String wxlrsj=null;
	String wcsj=null;
	String wxfy=null;
	String lrr=null;
	String clzt=null;
	bxxh=request.getParameter("bxxh");
	if (bxxh!=null)
	{
		bxxh=bxxh.trim();
		if (!(bxxh.equals("")))	wheresql+=" and (xz_dnsbbxsq.bxxh="+bxxh+") ";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dwbh='"+dwbh+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.fgsbh='"+fgsbh+"')";
	}
	sqr=request.getParameter("sqr");
	if (sqr!=null)
	{
		sqr=cf.GB2Uni(sqr);
		if (!(sqr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sqr='"+sqr+"')";
	}
	bxrq=request.getParameter("bxrq");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq>=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	bxrq=request.getParameter("bxrq2");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq<=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq>=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq2");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq<=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	dnsbflmc=request.getParameter("dnsbflmc");
	if (dnsbflmc!=null)
	{
		dnsbflmc=cf.GB2Uni(dnsbflmc);
		if (!(dnsbflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbflmc='"+dnsbflmc+"')";
	}
	bgr=request.getParameter("bgr");
	if (bgr!=null)
	{
		bgr=cf.GB2Uni(bgr);
		if (!(bgr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bgr='"+bgr+"')";
	}
	sfyzysj=request.getParameter("sfyzysj");
	if (sfyzysj!=null)
	{
		sfyzysj=cf.GB2Uni(sfyzysj);
		if (!(sfyzysj.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sfyzysj='"+sfyzysj+"')";
	}
	dnsbgzmc=request.getParameter("dnsbgzmc");
	if (dnsbgzmc!=null)
	{
		dnsbgzmc=cf.GB2Uni(dnsbgzmc);
		if (!(dnsbgzmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbgzmc='"+dnsbgzmc+"')";
	}
	gsbh=request.getParameter("gsbh");
	if (gsbh!=null)
	{
		gsbh=cf.GB2Uni(gsbh);
		if (!(gsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gsbh='"+gsbh+"')";
	}
	gdzcmc=request.getParameter("gdzcmc");
	if (gdzcmc!=null)
	{
		gdzcmc=cf.GB2Uni(gdzcmc);
		if (!(gdzcmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcmc='"+gdzcmc+"')";
	}
	bmbh=request.getParameter("bmbh");
	if (bmbh!=null)
	{
		bmbh=cf.GB2Uni(bmbh);
		if (!(bmbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bmbh='"+bmbh+"')";
	}
	gdzcflmc=request.getParameter("gdzcflmc");
	if (gdzcflmc!=null)
	{
		gdzcflmc=cf.GB2Uni(gdzcflmc);
		if (!(gdzcflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcflmc='"+gdzcflmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.xh='"+xh+"')";
	}
	pp=request.getParameter("pp");
	if (pp!=null)
	{
		pp=cf.GB2Uni(pp);
		if (!(pp.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pp='"+pp+"')";
	}
	pz1=request.getParameter("pz1");
	if (pz1!=null)
	{
		pz1=cf.GB2Uni(pz1);
		if (!(pz1.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz1='"+pz1+"')";
	}
	pz2=request.getParameter("pz2");
	if (pz2!=null)
	{
		pz2=cf.GB2Uni(pz2);
		if (!(pz2.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz2='"+pz2+"')";
	}
	pz3=request.getParameter("pz3");
	if (pz3!=null)
	{
		pz3=cf.GB2Uni(pz3);
		if (!(pz3.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz3='"+pz3+"')";
	}
	pz4=request.getParameter("pz4");
	if (pz4!=null)
	{
		pz4=cf.GB2Uni(pz4);
		if (!(pz4.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz4='"+pz4+"')";
	}
	pz5=request.getParameter("pz5");
	if (pz5!=null)
	{
		pz5=cf.GB2Uni(pz5);
		if (!(pz5.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz5='"+pz5+"')";
	}
	pz6=request.getParameter("pz6");
	if (pz6!=null)
	{
		pz6=cf.GB2Uni(pz6);
		if (!(pz6.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz6='"+pz6+"')";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.jsr='"+jsr+"')";
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
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxr='"+wxr+"')";
	}
	wxlrsj=request.getParameter("wxlrsj");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj>=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wxlrsj=request.getParameter("wxlrsj2");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj<=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj>=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj2");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj<=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wxfy=request.getParameter("wxfy");
	if (wxfy!=null)
	{
		wxfy=wxfy.trim();
		if (!(wxfy.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxfy="+wxfy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.lrr='"+lrr+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (xz_dnsbbxsq.clzt='"+clzt+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	
	ls_sql="SELECT bxxh,DECODE(clzt,'1','δ����','2','����','3','ά����','4','�ɹ���','5','������','6','���'),a.dwmc bxbm,sqr,bxrq,jhlqrq,dnsbflmc,dnsbgzmc,bgr, DECODE(sfyzysj,'N','��','Y','��'),gzxxsm,lrr,gsbh,gdzcmc,bmbh,gdzcflmc,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6,b.dwmc fgsmc  ";
	ls_sql+=" FROM xz_dnsbbxsq,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where xz_dnsbbxsq.dwbh=a.dwbh(+) and xz_dnsbbxsq.fgsbh=b.dwbh(+)";
	
	ls_sql+=" and xz_dnsbbxsq.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";

    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_dnsbbxsqJsList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"bxxh","dwbh","fgsbh","sqr","bxrq","jhlqrq","dnsbflmc","bgr","sfyzysj","dnsbgzmc","gzxxsm","gsbh","gdzcmc","bmbh","gdzcflmc","xh","pp","pz1","pz2","pz3","pz4","pz5","pz6","jsr","jssj","jdjg","clqk","wxr","wxlrsj","wcsj","wxfy","lrr","lrrq","clzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bxxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"��������"};//��ť����ʾ����
	String[] buttonLink={"Xz_dnsbbxsqJsList.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	String yhmc=(String)session.getAttribute("yhmc");
	String[] bxxh = request.getParameterValues("bxxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(bxxh,"bxxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update xz_dnsbbxsq set clzt='2',jsr='"+yhmc+"',jssj=TRUNC(SYSDATE) where "+chooseitem+" and clzt='1'";
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
  <B><font size="3">�������룭����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">���޲���</td>
	<td  width="3%">����������</td>
	<td  width="3%">��������</td>
	<td  width="3%">ϣ���������</td>
	<td  width="4%">���Լ��豸����</td>
	<td  width="4%">���Լ��豸���Ϸ���</td>
	<td  width="3%">�豸������</td>
	<td  width="3%">�豸���Ƿ�����Ҫ����</td>
	<td  width="13%">������ϸ˵��</td>
	<td  width="3%">¼����</td>
	<td  width="3%">�̶��ʲ����</td>
	<td  width="5%">�̶��ʲ�����</td>
	<td  width="3%">�̶��ʲ������ڱ��</td>
	<td  width="4%">�̶��ʲ�����</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">Ʒ��</td>
	<td  width="4%">����(CPU)</td>
	<td  width="4%">����(�ڴ�)</td>
	<td  width="4%">����(Ӳ��)</td>
	<td  width="4%">����(����)</td>
	<td  width="4%">����(�Կ�)</td>
	<td  width="4%">����(��ʾ��)</td>
	<td  width="5%">���޷ֹ�˾</td>
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