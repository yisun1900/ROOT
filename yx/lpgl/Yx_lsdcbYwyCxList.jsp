<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cqbm=null;
	String xqmc=null;
	String xsfs=null;
	String hxzl=null;
	String kfs=null;
	String jzs=null;
	String xss=null;
	String yzxfsp=null;
	String fyssj=null;
	String lrsj=null;
	String ywy=null;

	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (yx_lsdcb.lrr='"+lrr+"')";
	}

	String sftizxq=null;
	sftizxq=request.getParameter("sftizxq");
	if (sftizxq!=null)
	{
		sftizxq=cf.GB2Uni(sftizxq);
		if (!(sftizxq.equals("")))	wheresql+=" and  (yx_lsdcb.sftizxq='"+sftizxq+"')";
	}
	String sfjcxc=null;
	sfjcxc=request.getParameter("sfjcxc");
	if (sfjcxc!=null)
	{
		sfjcxc=cf.GB2Uni(sfjcxc);
		if (!(sfjcxc.equals("")))	wheresql+=" and  (yx_lsdcb.sfjcxc='"+sfjcxc+"')";
	}
	String xqbh=null;
	xqbh=request.getParameter("xqbh");
	if (xqbh!=null)
	{
		xqbh=cf.GB2Uni(xqbh);
		if (!(xqbh.equals("")))	wheresql+=" and  (yx_lsdcb.xqbh='"+xqbh+"')";
	}

	String yjzxsj=null;
	yjzxsj=request.getParameter("yjzxsj");
	if (yjzxsj!=null)
	{
		yjzxsj=yjzxsj.trim();
		if (!(yjzxsj.equals("")))	wheresql+="  and (yx_lsdcb.yjzxsj>=TO_DATE('"+yjzxsj+"','YYYY/MM/DD'))";
	}
	yjzxsj=request.getParameter("yjzxsj2");
	if (yjzxsj!=null)
	{
		yjzxsj=yjzxsj.trim();
		if (!(yjzxsj.equals("")))	wheresql+="  and (yx_lsdcb.yjzxsj<=TO_DATE('"+yjzxsj+"','YYYY/MM/DD'))";
	}
	
	
	
	String kfjd=null;
	kfjd=request.getParameter("kfjd");
	if (kfjd!=null)
	{
		kfjd=cf.GB2Uni(kfjd);
		if (!(kfjd.equals("")))	wheresql+=" and  (yx_lsdcb.kfjd='"+kfjd+"')";
	}
	String dysfwc=null;
	dysfwc=request.getParameter("dysfwc");
	if (dysfwc!=null)
	{
		dysfwc=cf.GB2Uni(dysfwc);
		if (!(dysfwc.equals("")))	wheresql+=" and  (yx_lsdcb.dysfwc='"+dysfwc+"')";
	}

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (yx_lsdcb.fgsbh='"+fgsbh+"')";
	}

	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+cqbm+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (yx_lsdcb.xqmc like '%"+xqmc+"%')";
	}

	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (yx_lsdcb.xsfs='"+xsfs+"')";
	}
	hxzl=request.getParameter("hxzl");
	if (hxzl!=null)
	{
		hxzl=cf.GB2Uni(hxzl);
		if (!(hxzl.equals("")))	wheresql+=" and  (yx_lsdcb.hxzl='"+hxzl+"')";
	}
	kfs=request.getParameter("kfs");
	if (kfs!=null)
	{
		kfs=cf.GB2Uni(kfs);
		if (!(kfs.equals("")))	wheresql+=" and  (yx_lsdcb.kfs='"+kfs+"')";
	}
	jzs=request.getParameter("jzs");
	if (jzs!=null)
	{
		jzs=cf.GB2Uni(jzs);
		if (!(jzs.equals("")))	wheresql+=" and  (yx_lsdcb.jzs='"+jzs+"')";
	}
	xss=request.getParameter("xss");
	if (xss!=null)
	{
		xss=cf.GB2Uni(xss);
		if (!(xss.equals("")))	wheresql+=" and  (yx_lsdcb.xss='"+xss+"')";
	}
	yzxfsp=request.getParameter("yzxfsp");
	if (yzxfsp!=null)
	{
		yzxfsp=cf.GB2Uni(yzxfsp);
		if (!(yzxfsp.equals("")))	wheresql+=" and  (yx_lsdcb.yzxfsp='"+yzxfsp+"')";
	}
	fyssj=request.getParameter("fyssj");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj>=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	fyssj=request.getParameter("fyssj2");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj<=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (yx_lsdcb.ywy='"+ywy+"')";
	}

    

	ls_sql="SELECT yx_lsdcb.xqbh,yx_lsdcb.dqbm,dqmc,xqmc,DECODE(kfjd,'1','δ����','2','������','3','����׼','4','δ��׼','5','�����') kfjd,DECODE(dysfwc,'N','δ���','Y','���') dysfwc,cqmc,b.dwmc tjdm,jw,dz,xz,xsfs,xszk,xqgm,hxzl,yzxfsp,fyssj,ywy,cclx,xqzhpj,xcxg,kfs,jzs,xss,sldh,DECODE(ywzxgs,'Y','��','N','��') ywzxgs,zxgssl,DECODE(ywwygs,'Y','��','N','��') ywwygs,yzxhs,ffdw,yx_lsdcb.dwdz,yx_lsdcb.dwdh,lxr,wyfzr,wydh,wylxr,lrr,lrsj,a.dwmc fgsbh  ";
	ls_sql+=" FROM yx_lsdcb,dm_cqbm,dm_dqbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yx_lsdcb.cqbm=dm_cqbm.cqbm and yx_lsdcb.dqbm=dm_dqbm.dqbm and yx_lsdcb.fgsbh=a.dwbh and yx_lsdcb.tjdm=b.dwbh(+)";
	if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and yx_lsdcb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
   ls_sql+=wheresql;
    ls_sql+=" order by yx_lsdcb.dqbm,xqmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_lsdcbYwyCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"xqbh","dqmc","xqmc","kfjd","dysfwc","cqmc","tjdm","jw","dz","xz","xsfs","xszk","xqgm","hxzl","yzxfsp","fyssj","ywy","cclx","xqzhpj","xcxg","kfs","jzs","xss","sldh","ywzxgs","zxgssl","ywwygs","yzxhs","ffdw","dwdz","dwdh","lxr","wyfzr","wydh","wylxr","lrr","lrsj","fgsbh"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","xqmc"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewYx_lsdcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xqmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">��ѯ��¥����Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">С�����</td>
	<td  width="1%">����</td>
	<td  width="3%">С������</td>
	<td  width="1%">��������</td>
	<td  width="1%">�����Ƿ����</td>
	<td  width="2%">����</td>
	<td  width="2%">�Ƽ�����</td>
	<td  width="2%">��λ</td>
	<td  width="4%">��ַ</td>
	<td  width="3%">����</td>
	<td  width="2%">���۷�ʽ</td>
	<td  width="6%">����״��</td>
	<td  width="4%">С����ģ</td>
	<td  width="3%">��������</td>
	<td  width="2%">¥�̶�λ</td>
	<td  width="2%">��Կ��ʱ��</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="5%">�ܱ߻������˳�·��</td>
	<td  width="7%">С���ۺ�����</td>
	<td  width="5%">����Ч��</td>
	<td  width="4%">������</td>
	<td  width="4%">������</td>
	<td  width="4%">������</td>
	<td  width="4%">��¥�绰</td>
	<td  width="1%">����װ�޹�˾</td>
	<td  width="1%">װ�޹�˾����</td>
	<td  width="1%">������ҵ��˾</td>
	<td  width="1%">��װ�޻���</td>
	<td  width="3%">�Ź���λ</td>
	<td  width="3%">��λ��ַ</td>
	<td  width="2%">��λ�绰</td>
	<td  width="2%">��ϵ��</td>
	<td  width="2%">��ҵ������</td>
	<td  width="3%">��ҵ�绰</td>
	<td  width="2%">��ҵ��ϵ��</td>
	<td  width="1%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">��˾</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>