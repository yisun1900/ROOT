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
	String cgjhph=null;
	String cgjhmc=null;
	String cgsqr=null;
	String jhkssj=null;
	String jhjssj=null;
	String jhje=null;
	String jhnr=null;
	String jhdzt=null;
	String ssfgs=null;
	String lrr=null;
	String lrsj=null;
	String shr=null;
	String shsj=null;
	String shjg=null;
	String shnr=null;
	String bz=null;
	String cglb=null;
	cglb=request.getParameter("cglb");
	if (cglb!=null)
	{
		cglb=cf.GB2Uni(cglb);
		if (!(cglb.equals("")))	wheresql+=" and  (cglb='"+cglb+"')";
	}
	String cllb=null;
	cllb=request.getParameter("cllb");
	if (cllb!=null)
	{
		cllb=cf.GB2Uni(cllb);
		if (!(cllb.equals("")))	wheresql+=" and  (cllb='"+cllb+"')";
	}
	cgjhph=request.getParameter("cgjhph");
	if (cgjhph!=null)
	{
		cgjhph=cf.GB2Uni(cgjhph);
		if (!(cgjhph.equals("")))	wheresql+=" and  (cgjhph='"+cgjhph+"')";
	}
	cgjhmc=request.getParameter("cgjhmc");
	if (cgjhmc!=null)
	{
		cgjhmc=cf.GB2Uni(cgjhmc);
		if (!(cgjhmc.equals("")))	wheresql+=" and  (cgjhmc='"+cgjhmc+"')";
	}
	cgsqr=request.getParameter("cgsqr");
	if (cgsqr!=null)
	{
		cgsqr=cf.GB2Uni(cgsqr);
		if (!(cgsqr.equals("")))	wheresql+=" and  (cgsqr='"+cgsqr+"')";
	}
	jhkssj=request.getParameter("jhkssj");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhkssj=request.getParameter("jhkssj2");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj2");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhje=request.getParameter("jhje");
	if (jhje!=null)
	{
		jhje=jhje.trim();
		if (!(jhje.equals("")))	wheresql+=" and  (jhje>="+jhje+") ";
	}
	jhje=request.getParameter("jhje2");
	if (jhje!=null)
	{
		jhje=jhje.trim();
		if (!(jhje.equals("")))	wheresql+=" and  (jhje<="+jhje+") ";
	}
	jhnr=request.getParameter("jhnr");
	if (jhnr!=null)
	{
		jhnr=cf.GB2Uni(jhnr);
		if (!(jhnr.equals("")))	wheresql+=" and  (jhnr like '%"+jhnr+"%')";
	}
	jhdzt=request.getParameter("jhdzt");
	if (jhdzt!=null)
	{
		jhdzt=cf.GB2Uni(jhdzt);
		if (!(jhdzt.equals("")))	wheresql+=" and  (jxc_clcgjh.jhdzt='"+jhdzt+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_clcgjh.ssfgs='"+ssfgs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shjg=request.getParameter("shjg");
	if (shjg!=null)
	{
		shjg=cf.GB2Uni(shjg);
		if (!(shjg.equals("")))	wheresql+=" and  (shjg='"+shjg+"')";
	}
	shnr=request.getParameter("shnr");
	if (shnr!=null)
	{
		shnr=cf.GB2Uni(shnr);
		if (!(shnr.equals("")))	wheresql+=" and  (shnr='"+shnr+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_clcgjh.bz='"+bz+"')";
	}
	ls_sql="SELECT cgjhph,DECODE(jhdzt,'0','δ�ύ','1','�ȴ����','2','������','3','�ѷֽⶩ��','5','�������','9','�ƻ����'),cgjhmc,dwmc,cgsqr,jhje,DECODE(shjg,'Y','ͨ��','N','δͨ��'),shr,shsj,shnr,lrr,lrsj,jxc_clcgjh.bz  ";
	ls_sql+=" FROM jxc_clcgjh,sq_dwxx  ";
    ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh ";
    ls_sql+=" and jxc_clcgjh.shjg='Y'";
    ls_sql+=" and jxc_clcgjh.cllb='0'";//0�����ģ�1������
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_clcgjh.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_clcgjh.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clcgjhFjList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cgjhph","cgjhmc","cgsqr","jhkssj","jhjssj","jhje","jhnr","jhdzt","ssfgs","lrr","lrsj","shr","shsj","shjg","shnr","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cgjhph"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"�����ֽ⣨ϵͳĬ�Ϲ�Ӧ�̣�"};//��ť����ʾ����
	String[] buttonLink={"SaveFjJxc_clcgjh.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"cgjhph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/cgjhgl/ViewJxc_clcgjh.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("cgjhph",coluParm);//�в����������Hash��
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
  <B><font size="3">���ݲɹ��ƻ���>���ɹ�Ӧ�̶���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�ɹ��ƻ�����</td>
	<td  width="5%">�ƻ���״̬</td>
	<td  width="8%">�ɹ��ƻ�����</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="4%">�ɹ�������</td>
	<td  width="6%">�ƻ����</td>
	<td  width="4%">��˽��</td>
	<td  width="4%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="20%">�������</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="40%">��ע</td>
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